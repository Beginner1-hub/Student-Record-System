<?php
include 'connect.php';

ini_set('display_errors', 1);
error_reporting(E_ALL);

if (!isset($_GET['id'])) {
    header("Location: view_student_fees.php?error=missing_id");
    exit;
}

$fee_id = $_GET['id'];

// Confirm the fee exists
$stmt = $pdo->prepare("SELECT * FROM fees WHERE id = ?");
$stmt->execute([$fee_id]);
$fee = $stmt->fetch();

if (!$fee) {
    header("Location: view_student_fees.php?error=not_found");
    exit;
}

// Now delete
$delete = $pdo->prepare("DELETE FROM fees WHERE id = ?");
$delete->execute([$fee_id]);

if ($delete->rowCount() > 0) {
    header("Location: view_student_fees.php?deleted=1");
} else {
    header("Location: view_student_fees.php?error=delete_failed");
}
exit;
