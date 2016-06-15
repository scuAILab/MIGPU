<?php
$name = $_REQUEST['name'];
$pass = $_REQUEST['pass'];

echo "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />
";

$con = mysql_connect("localhost", "root", "root");
if (!$con) {
    die('Could not connect: ' . mysql_error());
}

mysql_select_db("mllab", $con);


$result = mysql_query("SELECT * FROM users");
    while ($row = mysql_fetch_array($result)) {
        if ($row['name'] == $name && $row['pass'] == $pass) {
            $confirm = true;
        }
    }

if ($confirm == false) {
    echo "<script language=\"javascript\">";
    echo "document.location=\"index.html\"";
    echo "</script>";
}
else {
    echo "<script language=\"javascript\">";
    echo "document.location=\"main.html\"";
    echo "</script>";
}

?>