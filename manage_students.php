
<?php
session_start();
if (!isset($_SESSION['admin'])) {
    header("Location: login.php");
    exit;
}
require 'connect.php';

$students = $pdo->query("SELECT * FROM students WHERE is_deleted = 0 ORDER BY id DESC")->fetchAll();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Students</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center">
        <h3>Student Records</h3>
        <a href="add_student.php" class="btn btn-success">Add Student</a>
    </div>
    <table class="table table-striped mt-3">
        <thead class="table-dark">
            <tr>
                <th>ID</th><th>Name</th><th>Grade</th><th>Roll</th><th>Status</th><th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <?php foreach ($students as $student): ?>
            <tr>
                <td><?= $student['id'] ?></td>
                <td><?= htmlspecialchars($student['full_name']) ?></td>
                <td><?= $student['grade'] ?></td>
                <td><?= $student['roll_number'] ?></td>
                <td><?= $student['status'] ?></td>
                <td>
                    <a href="edit_student.php?id=<?= $student['id'] ?>" class="btn btn-sm btn-warning">Edit</a>
                    <a href="delete_student.php?id=<?= $student['id'] ?>" class="btn btn-sm btn-danger" onclick="return confirm('Delete this student?')">Delete</a>
                </td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
</div>
</body>
</html>
