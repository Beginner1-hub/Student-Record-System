<?php
session_start();
include 'connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['attendance'])) {
    $attendance = $_POST['attendance'];
    $date = $_POST['date'] ?? date('Y-m-d');
    $grade = $_POST['grade'] ?? '';

    foreach ($attendance as $studentId => $status) {
        $stmt = $pdo->prepare("REPLACE INTO attendance (student_id, attendance_date, status) VALUES (?, ?, ?)");
        $stmt->execute([$studentId, $date, $status]);
    }

    header("Location: attendance.php?grade=" . urlencode($grade) . "&date=" . urlencode($date) . "&success=1");
    exit;
}
?>
