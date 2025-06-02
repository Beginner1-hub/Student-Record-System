<?php
include 'connect.php';

// Fetch total fee collection grouped by grade
$stmt = $pdo->query("
  SELECT students.grade, 
         COUNT(fees.id) AS payment_count,
         SUM(fees.amount_paid) AS total_collected,
         SUM(fees.total_fee) AS expected_total
  FROM fees
  JOIN students ON students.id = fees.student_id
  GROUP BY students.grade
  ORDER BY students.grade ASC
");

$collections = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Fee Collection Summary</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-blue-50 to-purple-100 min-h-screen p-8">

  <div class="max-w-6xl mx-auto">
    <!-- Header -->
    <div class="mb-10 text-center">
      <h1 class="text-4xl font-bold text-blue-900">📊 Fee Collection Overview</h1>
      <p class="text-gray-600 mt-2 text-lg">Summary of total fee collections by grade</p>
    </div>

    <!-- Grade Summary Cards -->
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
      <?php foreach ($collections as $row): 
        $grade = htmlspecialchars($row['grade']);
        $total = number_format($row['total_collected'], 2);
        $expected = number_format($row['expected_total'], 2);
        $statusColor = $row['total_collected'] >= $row['expected_total'] ? 'bg-green-100 text-green-800' : 'bg-yellow-100 text-yellow-800';
      ?>
        <div class="bg-white border border-gray-200 rounded-xl shadow-lg p-6 hover:shadow-xl transition">
          <div class="text-xl font-semibold text-blue-800 mb-1">Grade <?= $grade ?></div>
          <div class="text-sm text-gray-500 mb-4">Payments: <?= $row['payment_count'] ?></div>

          <div class="flex justify-between text-base font-medium mb-2">
            <span>Total Collected</span>
            <span class="text-blue-700">₹<?= $total ?></span>
          </div>

          <div class="flex justify-between text-sm text-gray-600 mb-2">
            <span>Expected Total</span>
            <span>₹<?= $expected ?></span>
          </div>

          <div class="rounded-md px-3 py-1 text-sm font-semibold <?= $statusColor ?> inline-block">
            <?= $row['total_collected'] >= $row['expected_total'] ? 'On Target' : 'Pending Balance' ?>
          </div>
        </div>
      <?php endforeach; ?>
    </div>

    <!-- Back -->
    <div class="mt-10 text-center">
      <a href="admin_dashboard.php" class="text-blue-600 hover:underline text-sm">← Back to Dashboard</a>
    </div>
  </div>

</body>
</html>
