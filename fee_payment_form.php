<?php
include 'connect.php';

// Fetch the student details
if (!isset($_GET['id'])) {
    die('Student ID missing');
}

$id = $_GET['id'];
$stmt = $pdo->prepare("SELECT * FROM students WHERE id = ?");
$stmt->execute([$id]);
$student = $stmt->fetch();

if (!$student) {
    die('Student not found');
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Make Fee Payment</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-10">
    <div class="max-w-3xl mx-auto bg-white p-6 rounded shadow">
        <h2 class="text-2xl font-semibold text-blue-700">Make Payment for <?= htmlspecialchars($student['full_name']); ?></h2>

        <form action="update_fee.php" method="POST">
            <input type="hidden" name="student_id" value="<?= $student['id']; ?>">

            <label for="amount_paid" class="block text-sm font-medium text-gray-700">Amount Paid</label>
            <input type="number" name="amount_paid" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm" required>

            <div class="mt-6">
                <input type="submit" value="Update Payment" class="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700">
            </div>
        </form>

        <div class="mt-6">
            <a href="view_student_fees.php?id=<?= $student['id']; ?>" class="text-blue-600 hover:underline">View Fee Receipt</a>
        </div>
    </div>
</body>
</html>
