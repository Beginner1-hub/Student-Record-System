<?php
include 'connect.php';

ini_set('display_errors', 1);
error_reporting(E_ALL);

if (!isset($_GET['id'])) {
    die('Fee ID missing');
}
$fee_id = $_GET['id'];

// Handle submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $amount_paid = $_POST['amount_paid'];
    $status = $_POST['status'];

    $stmt = $pdo->prepare("UPDATE fees SET amount_paid = ?, status = ? WHERE id = ?");
    $stmt->execute([$amount_paid, $status, $fee_id]);

    if ($stmt->rowCount() > 0) {
        header("Location: view_student_fees.php?success=1");
    } else {
        header("Location: view_student_fees.php?error=1");
    }
    exit;
}

// Fetch current fee data
$stmt = $pdo->prepare("SELECT * FROM fees WHERE id = ?");
$stmt->execute([$fee_id]);
$fee = $stmt->fetch();

if (!$fee) {
    die("Fee record not found");
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Fee</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-6">
    <div class="max-w-xl mx-auto bg-white p-6 rounded shadow-lg">
        <h1 class="text-2xl font-semibold text-blue-700 mb-4">Edit Fee Record</h1>

        <form method="POST">
            <label class="block mb-2 font-medium text-gray-700">Month</label>
            <input type="text" disabled value="<?= htmlspecialchars($fee['month']) ?>" class="w-full p-2 bg-gray-100 border rounded mb-4" />

            <label class="block mb-2 font-medium text-gray-700">Amount Paid</label>
            <input type="number" name="amount_paid" value="<?= $fee['amount_paid'] ?>" class="w-full p-2 border rounded mb-4" required>

            <label class="block mb-2 font-medium text-gray-700">Status</label>
            <select name="status" class="w-full p-2 border rounded mb-4" required>
                <option value="paid" <?= $fee['status'] === 'paid' ? 'selected' : '' ?>>Paid</option>
                <option value="unpaid" <?= $fee['status'] === 'unpaid' ? 'selected' : '' ?>>Unpaid</option>
            </select>

            <div class="flex justify-between">
                <a href="view_student_fees.php" class="bg-gray-500 text-white px-4 py-2 rounded hover:bg-gray-600">Cancel</a>
                <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">Update</button>
            </div>
        </form>
    </div>
</body>
</html>
