
<?php
session_start();
if (!isset($_SESSION['admin'])) {
    header("Location: login.php");
    exit;
}
require 'connect.php';

$total_students = $pdo->query("SELECT COUNT(*) FROM students WHERE is_deleted = 0")->fetchColumn();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Admin Dashboard</a>
        <a class="btn btn-danger" href="logout.php">Logout</a>
    </div>
</nav>

<div class="container mt-4">
    <h3>Welcome, <?= $_SESSION['admin'] ?></h3>
    <div class="row mt-3">
        <div class="col-md-4">
            <div class="card text-bg-primary mb-3">
                <div class="card-body">
                    <h5 class="card-title">Total Students</h5>
                    <p class="card-text fs-3"><?= $total_students ?></p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
