<?php
include("db.php");

session_start();

$username = $_POST['username'];
$password = $_POST['password'];

$sql = "SELECT * FROM users WHERE username='$username' AND password='$password'";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) == 1) {
    $_SESSION['username'] = $username;
    header("Location: dashboard.php");
} else {
    echo "Invalid username or password.";
}
?>
