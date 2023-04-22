<?php
@ini_set("max_execution_time", 36000);
@set_time_limit(36000);
@ini_set("display_errors", "1");
@error_reporting(E_ALL);
session_start();

$class = new Migrate();
$class->index();



class Migrate {
    protected $folders = [''];
    var $save = false;
    var $path = null;

    function __construct()
    {
        if (version_compare(phpversion(), '5.3', '<'))
            $this->path = dirname($_SERVER["SCRIPT_FILENAME"]);
        else
            $this->path = __DIR__;

        $this->path_file =  $this->path . "/MG-files.db";
        if ( !file_exists($this->path_file) ) {
            //touch($this->path_file);
            $data = gzencode( json_encode([]), 9 );
            $fp = fopen($this->path_file, "w");
            fwrite($fp, $data);
            fclose($fp);
        }
        if ( isset($_GET['get-list-and-save']) ) $this->save = true;
    }

    function index()
    {
        if (!isset($_GET['get-zip']) )
            echo '
                <h3>Migration files</h3>
                <a href="?get-list">Get list files</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="?get-list-and-save">Get list files and save</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="?save-current">Save current list</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="?get-zip">Get Zip current list</a>
            ';
        if (isset($_GET['get-list']) || isset($_GET['get-list-and-save'])) $this->getList();
        if (isset($_GET['save-current']) ) $this->saveList();
        if (isset($_GET['get-zip']) ) $this->getZip();
        if (isset($_GET['update-prod-site']) ) $this->updateProdSite();
    }

    function getData()
    {
        //$data = file_get_contents($this->path_file);
        $data = gzdecode(file_get_contents($this->path_file));
        return ( !empty($data)?json_decode($data,true):[] );
    }

    function saveList($filesNOT=null)
    {
        if (empty($_SESSION['saveFileInDB'])) exit('<p>No files. Please go to the <a href="?get-list">\'Get list files\'</a>. </p>');

        $files = $_SESSION['saveFileInDB']['files'];
        $changedFiles = $_SESSION['saveFileInDB']['changedFiles'];
        if (!is_null($filesNOT)) foreach ($filesNOT as $item) unset( $files[$item] );
        //d($changedFiles);
        $this->save = true;
        if ( $this->save && !empty($changedFiles) ) {
            $data = gzencode( json_encode($files), 9 );
            //$data = json_encode($files);
            $fp = fopen($this->path_file, "w");
            fwrite($fp, $data);
            fclose($fp);
            echo '<p>SAVE OK!</p>';
        }
        unset($_SESSION['saveFileInDB']);
        /*
                $ar = ['add','update','delete'];
                foreach ($ar as $row) {
                    if ( isset($changedFiles[$row]) ) {
                        echo '<p>&nbsp;</p><b>'.$row.'</b><hr>';
                        foreach ($changedFiles[$row] as $item) echo $item['file'].'<br>';
                    }
                }
        */
    }

    function getZip()
    {
        if (empty($_SESSION['saveFileInDB'])) exit('<p>No files. Please go to the <a href="?get-list">\'Get list files\'</a>. </p>');

        $changedFiles = $_SESSION['saveFileInDB']['changedFiles'];
        //d($changedFiles);
        if ( !empty($changedFiles) ) {
            $zip = new ZipArchive();
            $filename = $this->path."/MG-files.zip";
            if (file_exists($filename)) unlink($filename);
            if ($zip->open($filename, ZipArchive::CREATE)!==TRUE) {
                exit("Невозможно открыть <$filename>\n");
            }
            $ar = ['add','update'];
            foreach ($ar as $row) {
                if ( isset($changedFiles[$row]) ) {
                    //echo '<p>&nbsp;</p><b>'.$row.'</b><hr>';
                    foreach ($changedFiles[$row] as $item) {
                        //echo $item['file'].'<br>';
                        $zip->addFile($this->base_path().'/'.$item['file'], $item['file']);
                        //echo "numfiles: " . $zip->numFiles . "<br>";
                        //echo "status:" . $zip->status . "<br>";
                    }
                }
            }
            $zip->close();

            unset($_SESSION['saveFileInDB']);

            header('Content-Description: File Transfer');
            header('Content-Type: application/octet-stream');
            header('Content-Disposition: attachment; filename="'.basename($filename).'"');
            header('Expires: 0');
            header('Cache-Control: must-revalidate');
            header('Pragma: public');
            header('Content-Length: ' . filesize($filename));
            readfile($filename);
            unlink($filename);
            exit();
        }
        unset($_SESSION['saveFileInDB']);

    }

    function getList()
    {
        unset($_SESSION['saveFileInDB']);

        $lastFiles = $this->getData();
        //d($lastFiles);
        // получили список текущих файлов
        $files = [];
        foreach ($this->folders as $key=>$row){
            $files = array_merge($files, $this->getDir($this->base_path($row)));
        }
        // ищем разные и заносим в архив
        $changedFiles = [];
        foreach ($files as $file=>$data)
        {
            if ( !isset($lastFiles[$file]) ) $changedFiles['add'][] = $data;
            else {
                if ( isset($lastFiles[$file]) && $lastFiles[$file]['size'] != $data['size'] ) $changedFiles['update'][] = $data;
            }
            if (isset($lastFiles[$file])) unset($lastFiles[$file]);
        }
        if ( !empty($lastFiles) ) {
            foreach ($lastFiles as $file=>$data)
            {
                $changedFiles['delete'][] = $data;
            }
        }

        if ( !empty($changedFiles) )
            $_SESSION['saveFileInDB'] = [
                'files' => $files,
                'changedFiles' => $changedFiles
            ];
        //d($changedFiles);
        if ( $this->save && !empty($changedFiles) ) {
            $data = gzencode( json_encode($files), 9 );
            //d($files);
            //$data = json_encode($files);
            $fp = fopen($this->path_file, "w");
            fwrite($fp, $data);
            fclose($fp);
            echo '<p>SAVE OK!</p>';
        }

        $ar = ['add','update','delete'];
        foreach ($ar as $row) {
            if ( isset($changedFiles[$row]) ) {
                echo '<p>&nbsp;</p><b>'.$row.'</b><hr>';
                foreach ($changedFiles[$row] as $item) echo $item['file'].'<br>';
            }
        }

        //d($changedFiles);
    }

    function getDir($dir)
    {
        $res = [];
        if ($objs = glob($dir . "/*", GLOB_NOSORT))
        {
            foreach ($objs as $obj) {
                if (is_dir($obj)) {
                    $res = array_merge($res, $this->getDir($obj));
                }
                else {
                    if ( basename($obj) == 'MG-files.db' ) continue;
                    if ( basename($obj) == 'MG-files.zip' ) continue;
                    if ( basename($obj) == 'migration.php' ) continue;
                    if ( basename($obj) == 'update.php' ) continue;
                    $file = str_replace($this->base_path().'/','',$obj);
                    $res[$file] = [
                        'file' => $file,
                        'size' => filesize($obj),
                        //'time' => filemtime($obj)
                    ];
                }
            }
        }
        return $res;
    }

    function base_path($path=null)
    {
        return $_SERVER['DOCUMENT_ROOT'].(!is_null($path)?'/'.$path:'');
    }

}

function d($msg = '', $stop=true, $caption='', $return=false){
    $arrParentInfo = debug_backtrace();
    if (is_null($msg) || is_bool($msg)) $msg = '<span style="color:#0F2FE2">'.var_export($msg,true).'</span>';
    $str='<pre>';
    $str.='---- Debug Info <span style="color: #0F2FE2;">'.$caption.'</span> -- <span style="font-size: 10px;">'.date("Y-m-d H:i:s").'</span> -- <span style="font-size: 10px;color: #A29E9E;">'.str_replace($_SERVER['DOCUMENT_ROOT'], '', $arrParentInfo[0]['file']).' ('.$arrParentInfo[0]['line'].')</span> ----<br>';
    $str.=print_r($msg, true);
    $str.='<br>';
    $str.='-------------------------------------------<br>';
    $str.='</pre>';
    if ( $return ) return $str;
    echo $str;
    if ( $stop ) exit();
}
