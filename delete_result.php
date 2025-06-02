<?php
session_start();
include 'connect.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $studentId = trim($_POST['student_id'] ?? '');
    $month = trim($_POST['month'] ?? '');
    $grade = $_POST['grade'] ?? '';
    $admin_id = $_SESSION['admin_id'] ?? null;

    if ($studentId && $month) {
        $stmt = $pdo->prepare("SELECT * FROM result WHERE student_id = ? AND month = ?");
        $stmt->execute([$studentId, $month]);
        $result = $stmt->fetch();

        if ($result) {
            $logStmt = $pdo->prepare("INSERT INTO result_log (student_id, marks_obtained, max_marks, grade, remarks, exam_type, percentage, changed_at, admin_id, month)
                                      VALUES (?, ?, ?, ?, ?, ?, ?, NOW(), ?, ?)");
            $logStmt->execute([
                $studentId,
                $result['marks_obtained'],
                $result['max_marks'],
                $result['grade'],
                $result['remarks'],
                $result['exam_type'],
                $result['percentage'],
                $admin_id,
                $month
            ]);

            $deleteStmt = $pdo->prepare("DELETE FROM result WHERE student_id = ? AND month = ?");
            $deleteStmt->execute([$studentId, $month]);

            $activityStmt = $pdo->prepare("INSERT INTO activity_log (student_id, action, description, admin_id, created_at)
                                           VALUES (?, ?, ?, ?, NOW())");
            $activityStmt->execute([
                $studentId,
                'Result Deleted',
                "Deleted result for $month",
                $admin_id
            ]);

            echo json_encode(["success" => true, "message" => "Result deleted successfully."]);
        } else {
            echo json_encode(["success" => false, "message" => "No result found to delete."]);
        }
    } else {
        echo json_encode(["success" => false, "message" => "Invalid student ID or month."]);
    }
    exit;
} else {
    echo json_encode(["success" => false, "message" => "Invalid request method."]);
    exit;
}
