<?php
include 'connect.php';

if (isset($_GET['id'])) {
    $studentId = $_GET['id'];

    // Soft delete: Set is_deleted = 1
    $sql = "UPDATE students SET is_deleted = 1 WHERE id = :id";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':id', $studentId, PDO::PARAM_INT);

    if ($stmt->execute()) {
        // Redirect back with success message
        header("Location: view_students.php?message=deleted");
        exit;
    } else {
        // Redirect with error message
        header("Location: view_students.php?message=error");
        exit;
    }
} else {
    header("Location: view_students.php?message=invalid");
    exit;
}
