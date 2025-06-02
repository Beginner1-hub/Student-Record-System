<?php
session_start();
include 'connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['results'])) {
    $results = $_POST['results'];
    $admin_id = $_SESSION['admin_id'] ?? null;
    $month = $_POST['month'] ?? 'General';
    $redirectGrade = $_POST['grade'] ?? '';

    foreach ($results as $studentId => $data) {
        if (!is_numeric($studentId)) continue;

        // Skip non-matching if single save
        if (isset($_POST['single_save']) && $_POST['single_save'] != $studentId) {
            continue;
        }

        if (!isset($data['marks_obtained']) || $data['marks_obtained'] === '') {
            continue;
        }

        $marks = (float) $data['marks_obtained'];
        $max = 700;
        $percentage = $marks > 0 ? round(($marks / $max) * 100, 2) : 0;

        // Grade calculation
        if ($percentage >= 90) { $calculatedGrade = 'A+'; $remarks = 'Outstanding'; }
        elseif ($percentage >= 80) { $calculatedGrade = 'A'; $remarks = 'Excellent'; }
        elseif ($percentage >= 70) { $calculatedGrade = 'B'; $remarks = 'Very Good'; }
        elseif ($percentage >= 60) { $calculatedGrade = 'C'; $remarks = 'Good'; }
        elseif ($percentage >= 50) { $calculatedGrade = 'D'; $remarks = 'Average'; }
        else { $calculatedGrade = 'F'; $remarks = 'Needs Improvement'; }

        $examType = $data['exam_type'] ?? 'online';

        // Check if result exists
        $checkStmt = $pdo->prepare("SELECT * FROM result WHERE student_id = ? AND month = ?");
        $checkStmt->execute([$studentId, $month]);
        $existing = $checkStmt->fetch();

        if ($existing) {
            // Log previous result
            $logStmt = $pdo->prepare("INSERT INTO result_log (student_id, marks_obtained, max_marks, grade, remarks, exam_type, percentage, changed_at, admin_id, month) 
                                      VALUES (?, ?, ?, ?, ?, ?, ?, NOW(), ?, ?)");
            $logStmt->execute([
                $studentId,
                $existing['marks_obtained'],
                $existing['max_marks'],
                $existing['grade'],
                $existing['remarks'],
                $existing['exam_type'],
                $existing['percentage'],
                $admin_id,
                $month
            ]);

            // Update
            $updateStmt = $pdo->prepare("UPDATE result 
                                         SET marks_obtained = ?, max_marks = ?, grade = ?, remarks = ?, exam_type = ?, percentage = ? 
                                         WHERE student_id = ? AND month = ?");
            $updateStmt->execute([$marks, $max, $calculatedGrade, $remarks, $examType, $percentage, $studentId, $month]);
        } else {
            // Insert
            $insertStmt = $pdo->prepare("INSERT INTO result 
                                         (student_id, marks_obtained, max_marks, grade, remarks, exam_type, percentage, created_at, month) 
                                         VALUES (?, ?, ?, ?, ?, ?, ?, NOW(), ?)");
            $insertStmt->execute([$studentId, $marks, $max, $calculatedGrade, $remarks, $examType, $percentage, $month]);
        }

        // Log activity
        $activityStmt = $pdo->prepare("INSERT INTO activity_log (student_id, action, description, admin_id, created_at) 
                                       VALUES (?, ?, ?, ?, NOW())");
        $activityStmt->execute([
            $studentId,
            'Result Updated',
            "Updated $examType result for $month with $marks marks ($calculatedGrade)",
            $admin_id
        ]);
    }

    // Redirect with grade and month preserved
    header("Location: result.php?success=1" 
        . ($redirectGrade ? "&grade=" . urlencode($redirectGrade) : '') 
        . ($month ? "&month=" . urlencode($month) : '')
    );
    exit;
} else {
    echo "Invalid access.";
    exit;
}
?>
