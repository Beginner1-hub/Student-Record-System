<?php
session_start();
include 'connect.php';

// ✅ Helper to log activity
function logActivity($pdo, $adminId, $studentId, $action, $description) {
    $stmt = $pdo->prepare("INSERT INTO activity_log (admin_id, student_id, action, description, created_at) VALUES (?, ?, ?, ?, NOW())");
    $stmt->execute([$adminId, $studentId, $action, $description]);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $student_id   = $_POST['student_id'];
    $month        = $_POST['month'];
    $amount_paid  = $_POST['amount_paid'];
    $total_fee    = $_POST['total_fee'];

    $admin_id = $_SESSION['admin_id'] ?? null;

    // Determine fee status
    $status = ($amount_paid >= $total_fee) ? 'paid' : 'unpaid';

    // Check if fee for this student and month already exists
    $check = $pdo->prepare("SELECT * FROM fees WHERE student_id = ? AND month = ?");
    $check->execute([$student_id, $month]);

    if ($check->rowCount() > 0) {
        header("Location: view_student_fees.php?error=already_exists");
        exit;
    }

    // Insert new fee record
    $stmt = $pdo->prepare("INSERT INTO fees (student_id, month, total_fee, amount_paid, status, created_at) VALUES (?, ?, ?, ?, ?, NOW())");
    $success = $stmt->execute([$student_id, $month, $total_fee, $amount_paid, $status]);

    if ($success) {
        // ✅ Log fee addition activity
        if ($admin_id) {
            logActivity($pdo, $admin_id, $student_id, 'Fee Added', "Fee added for $month (Status: $status)");
        }

        header("Location: view_student_fees.php?success=1");
    } else {
        header("Location: view_student_fees.php?error=1");
    }

    exit;
}
?>
