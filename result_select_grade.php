<?php
include 'connect.php';

$grades = range(1, 10);
$selectedMonth = $_GET['month'] ?? '';
$months = ["General", "January", "February", "March", "April", "May", "June",
           "July", "August", "September", "October", "November", "December"];
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Result Management</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
    .grade-card {
      transition: all 0.3s ease-in-out;
      position: relative;
    }
    .grade-card:hover {
      box-shadow: 0 10px 20px rgba(99, 102, 241, 0.3);
      transform: translateY(-5px) scale(1.03);
      background: linear-gradient(145deg, #eef2ff, #f3e8ff);
    }
    .grade-card .watermark {
      position: absolute;
      top: 10px;
      right: 10px;
      font-size: 2rem;
      color: rgba(99, 102, 241, 0.1);
      font-weight: 900;
      pointer-events: none;
    }
  </style>
</head>
<body class="bg-gray-100 font-sans">
<div class="flex">
  <!-- Sidebar -->
  <aside class="w-64 bg-blue-900 text-white min-h-screen p-6 shadow-xl">
    <div class="text-center mb-10">
      <h1 class="text-3xl font-extrabold">Student<span class="text-yellow-300">Admin</span></h1>
    </div>
    <nav>
      <ul class="space-y-4 text-base font-medium">
        <li><a href="admin_dashboard.php" class="flex items-center gap-3 px-4 py-2 hover:bg-white/10 rounded"><i class="fas fa-home"></i><span>Dashboard</span></a></li>
        <li><a href="result_select_grade.php" class="flex items-center gap-3 px-4 py-2 bg-gradient-to-r from-blue-700 to-indigo-800 rounded shadow font-semibold"><i class="fas fa-chart-bar"></i><span>Results</span></a></li>
        <li><a href="view_result_log.php" class="flex items-center gap-3 px-4 py-2 hover:bg-white/10 rounded"><i class="fas fa-history"></i><span>Result History</span></a></li>
        <li><a href="logout.php" class="flex items-center gap-3 px-4 py-2 text-red-400 hover:text-red-200"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a></li>
      </ul>
    </nav>
  </aside>

  <!-- Main content -->
  <main class="flex-1 p-6 sm:p-8">
    <div class="bg-white p-6 sm:p-8 rounded-xl shadow border-t-4 border-indigo-700">
      <div class="flex flex-col md:flex-row justify-between items-center mb-6">
        <h2 class="text-3xl font-bold text-indigo-700 flex items-center gap-2"><i class="fas fa-graduation-cap"></i> Result Management</h2>
        <a href="admin_dashboard.php" class="mt-4 md:mt-0 bg-indigo-600 hover:bg-indigo-700 text-white px-4 py-2 rounded shadow text-sm">← Dashboard</a>
      </div>

      <form method="GET" class="flex flex-wrap gap-4 items-center mb-8">
        <label class="text-gray-700 font-medium">Select Month:</label>
        <select name="month" onchange="this.form.submit()" class="px-4 py-2 border rounded shadow bg-white text-sm">
          <option value="">All Months</option>
          <?php foreach ($months as $month): ?>
            <option value="<?= $month ?>" <?= $selectedMonth === $month ? 'selected' : '' ?>><?= $month ?></option>
          <?php endforeach; ?>
        </select>
      </form>

      <h3 class="text-xl font-semibold text-gray-800 mb-6">Select a Grade to Manage Results</h3>
      <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
        <?php foreach ($grades as $grade): ?>
          <a href="result.php?grade=<?= $grade ?>&month=<?= urlencode($selectedMonth) ?>" class="grade-card block bg-white p-6 rounded-xl border border-indigo-100 shadow text-center">
            <div class="text-2xl sm:text-3xl font-extrabold text-indigo-800 mb-1">Grade <?= $grade ?></div>
            <p class="text-gray-600 text-sm">Manage results for Grade <?= $grade ?></p>
            <div class="watermark">G<?= $grade ?></div>
          </a>
        <?php endforeach; ?>
      </div>
    </div>
  </main>
</div>
</body>
</html>
