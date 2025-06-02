<?php
include 'connect.php';

$grade = $_GET['grade'] ?? '';
if (!$grade) {
    echo json_encode([]);
    exit;
}

$stmt = $pdo->prepare("SELECT id, full_name, roll_number FROM students WHERE grade = ? AND is_deleted = 0 ORDER BY full_name");
$stmt->execute([$grade]);
echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
?>
