<?php
include 'connect.php';

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $student_id = $_POST['student_id'];
    $fee_month = $_POST['fee_month'];
    $amount_paid = $_POST['amount_paid'];

    // You can set a static total fee or fetch it dynamically if needed
    $total_fee = 5000; // example static amount

    $status = ($amount_paid >= $total_fee) ? 'paid' : 'unpaid';

    // Check if fee already exists for this student and month
    $check = $pdo->prepare("SELECT * FROM fees WHERE student_id = ? AND month = ?");
    $check->execute([$student_id, $fee_month]);

    if ($check->rowCount() > 0) {
        echo "<script>alert('Fee already recorded for this student in $fee_month'); window.location.href='insert_fee.php';</script>";
        exit;
    }

    $stmt = $pdo->prepare("INSERT INTO fees (student_id, month, total_fee, amount_paid, status) VALUES (?, ?, ?, ?, ?)");
    $stmt->execute([$student_id, $fee_month, $total_fee, $amount_paid, $status]);

    echo "<script>alert('Fee payment recorded successfully'); window.location.href='view_student.php?id=$student_id';</script>";
}
?>
