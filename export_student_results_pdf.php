<?php
include 'connect.php';

if (!isset($_GET['student_id'])) {
    die("Student ID missing.");
}

$id = $_GET['student_id'];

// Fetch student info
$stmt = $pdo->prepare("SELECT * FROM students WHERE id = ?");
$stmt->execute([$id]);
$student = $stmt->fetch();

if (!$student) {
    die("Student not found.");
}

// Fetch result records
$resultStmt = $pdo->prepare("SELECT * FROM result WHERE student_id = ?");
$resultStmt->execute([$id]);
$results = $resultStmt->fetchAll();

ob_start();
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Result Report</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        h2 { text-align: center; color: #333; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; font-size: 14px; }
        th, td { border: 1px solid #666; padding: 8px; text-align: center; }
        th { background-color: #f2f2f2; }
        .info { margin-bottom: 20px; }
        .info p { margin: 4px 0; }
    </style>
</head>
<body>

<h2>Result Report: <?= htmlspecialchars($student['full_name']) ?></h2>

<div class="info">
    <p><strong>Grade:</strong> <?= $student['grade'] ?></p>
    <p><strong>Section:</strong> <?= $student['section'] ?></p>
    <p><strong>Roll Number:</strong> <?= $student['roll_number'] ?></p>
    <p><strong>Guardian:</strong> <?= htmlspecialchars($student['guardian_name']) ?></p>
</div>

<?php if (count($results)): ?>
    <table>
        <thead>
            <tr>
                <th>Exam Type</th>
                <th>Marks Obtained</th>
                <th>Max Marks</th>
                <th>Percentage</th>
                <th>Grade</th>
                <th>Remarks</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($results as $res): 
                $percentage = ($res['marks_obtained'] / $res['max_marks']) * 100;
            ?>
            <tr>
                <td><?= ucfirst($res['exam_type']) ?></td>
                <td><?= $res['marks_obtained'] ?></td>
                <td><?= $res['max_marks'] ?></td>
                <td><?= round($percentage, 2) ?>%</td>
                <td><?= $res['grade'] ?></td>
                <td><?= $res['remarks'] ?></td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
<?php else: ?>
    <p>No result records available.</p>
<?php endif; ?>

</body>
</html>

<?php
$html = ob_get_clean();

// Output as PDF using browser print dialog (fallback method)
echo $html;
echo "<script>window.onload = () => window.print();</script>";
