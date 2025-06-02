<?php
session_start();
require 'connect.php';

if (!isset($_SESSION['admin_id'])) {
    header("Location: login.php");
    exit;
}

$adminUsername = htmlspecialchars($_SESSION['admin_username'] ?? 'Admin');
$adminRole = $_SESSION['admin_role'] ?? 'full';

$totalStudents = $pdo->query("SELECT COUNT(*) FROM students WHERE is_deleted = 0")->fetchColumn();
$newAdmissions = $pdo->query("
    SELECT COUNT(*) FROM students 
    WHERE MONTH(created_at) = MONTH(CURDATE()) 
      AND YEAR(created_at) = YEAR(CURDATE()) 
      AND is_deleted = 0
")->fetchColumn();
$totalFees = $pdo->query("SELECT SUM(amount_paid) FROM fees")->fetchColumn() ?? 0;

$recentLogs = $pdo->query(" 
  SELECT 'result' AS type, rl.changed_at AS activity_time, a.username AS admin_user, s.full_name,  
         CONCAT('Updated result (', rl.exam_type, ')') AS action_desc
  FROM result_log rl
  JOIN students s ON rl.student_id = s.id
  LEFT JOIN admin a ON rl.admin_id = a.id

  UNION ALL

  SELECT 'fee' AS type, al.created_at AS activity_time, ad.username AS admin_user, s.full_name, al.description AS action_desc
  FROM activity_log al
  JOIN students s ON al.student_id = s.id
  LEFT JOIN admin ad ON al.admin_id = ad.id

  ORDER BY activity_time DESC
  LIMIT 5
")->fetchAll();

$resultSummary = $pdo->query("
  SELECT students.grade,
         COUNT(*) AS total_students,
         SUM(CASE WHEN (r.marks_obtained / r.max_marks) * 100 >= 50 THEN 1 ELSE 0 END) AS passed_students
  FROM students
  JOIN result r ON students.id = r.student_id
  WHERE students.is_deleted = 0
  GROUP BY students.grade
  ORDER BY students.grade
")->fetchAll();
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Admin Dashboard</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body class="bg-gray-100 font-sans">
<div class="flex flex-col md:flex-row min-h-screen">
  <!-- Mobile Navbar -->
  <div class="md:hidden flex items-center justify-between bg-blue-900 text-white p-4">
    <h1 class="text-2xl font-extrabold">Student<span class="text-yellow-300">Admin</span></h1>
    <button onclick="document.getElementById('mobileSidebar').classList.toggle('hidden')">
      <i class="fas fa-bars text-white text-xl"></i>
    </button>
  </div>

  <!-- Sidebar -->
  <aside id="mobileSidebar" class="w-full md:w-64 bg-blue-900 text-white p-5 md:block hidden md:min-h-screen shadow-xl">
    <div class="text-center mb-10 hidden md:block">
      <h1 class="text-3xl font-extrabold">Student<span class="text-yellow-300">Admin</span></h1>
    </div>
    <nav>
      <ul class="space-y-3 text-base font-medium">
        <?php function active($file) { return basename($_SERVER['PHP_SELF']) === $file ? 'bg-gradient-to-r from-blue-700 to-indigo-800 font-semibold shadow rounded-lg' : 'hover:bg-white/10 rounded'; } ?>
        <li><a href="admin_dashboard.php" class="flex items-center gap-3 px-4 py-3 <?= active('admin_dashboard.php') ?>"><i class="fas fa-home"></i><span>Dashboard</span></a></li>
        <?php if ($adminRole === 'full'): ?>
          <li><a href="add_student.php" class="flex items-center gap-3 px-4 py-3 <?= active('add_student.php') ?>"><i class="fas fa-user-plus"></i><span>Add Student</span></a></li>
        <?php endif; ?>
        <li><a href="view_students.php" class="flex items-center gap-3 px-4 py-3 <?= active('view_students.php') ?>"><i class="fas fa-users"></i><span>View All Students</span></a></li>
        <?php if ($adminRole === 'full'): ?>
          <li><a href="view_student_fees.php" class="flex items-center gap-3 px-4 py-3 <?= active('view_student_fees.php') ?>"><i class="fas fa-credit-card"></i><span>Student Fees Management</span></a></li>
          <li><a href="result_select_grade.php" class="flex items-center gap-3 px-4 py-3 <?= active('result_select_grade.php') ?>"><i class="fas fa-chart-bar"></i><span>Results</span></a></li>
          <li><a href="view_result_log.php" class="flex items-center gap-3 px-4 py-3 <?= active('view_result_log.php') ?>"><i class="fas fa-history"></i><span>Result History</span></a></li>
          <li><a href="view_activity_log.php" class="flex items-center gap-3 px-4 py-3 <?= active('view_activity_log.php') ?>"><i class="fas fa-clipboard-list"></i><span>Activity Logs</span></a></li>
        <?php endif; ?>
        <li><a href="attendance.php" class="flex items-center gap-3 px-4 py-3 <?= active('attendance.php') ?>"><i class="fas fa-calendar-check"></i><span>Mark Attendance</span></a></li>
        <li><a href="view_attendance.php" class="flex items-center gap-3 px-4 py-3 <?= active('view_attendance.php') ?>"><i class="fas fa-calendar-alt"></i><span>View Attendance</span></a></li>
        <li><a href="logout.php" class="flex items-center gap-3 px-4 py-3 text-red-400 hover:text-red-200"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a></li>
      </ul>
    </nav>
  </aside>

  <!-- Main Content -->
  <main class="flex-1 p-4 sm:p-8">
    <!-- Header -->
    <header class="flex flex-col sm:flex-row justify-between items-start sm:items-center bg-white shadow p-4 rounded-md mb-6 gap-4">
      <h2 class="text-2xl font-bold text-gray-800">Welcome, <?= $adminUsername ?></h2>
      <div class="relative">
        <button onclick="toggleDropdown()" class="flex items-center gap-2 px-4 py-2 bg-blue-600 text-white rounded-full shadow">
          <i class="fas fa-user-circle text-lg"></i>
          <?= $adminUsername ?>
          <i class="fas fa-caret-down text-sm"></i>
        </button>
        <div id="dropdownMenu" class="hidden absolute right-0 mt-2 w-48 bg-white border rounded shadow-lg z-10">
          <a href="#" class="block px-4 py-2 hover:bg-gray-100">Profile</a>
          <a href="logout.php" class="block px-4 py-2 hover:bg-red-100 text-red-600">Logout</a>
        </div>
      </div>
    </header>

    <!-- Summary Cards -->
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mb-10">
      <div class="bg-white p-6 rounded-xl shadow-lg border-t-4 border-blue-500">
        <h3 class="text-sm font-semibold text-gray-500">Total Students</h3>
        <p class="text-4xl font-bold text-blue-700 mt-2"><?= $totalStudents ?></p>
      </div>
      <div class="bg-white p-6 rounded-xl shadow-lg border-t-4 border-green-500">
        <h3 class="text-sm font-semibold text-gray-500">New Admissions</h3>
        <p class="text-4xl font-bold text-green-600 mt-2"><?= $newAdmissions ?></p>
      </div>
      <div class="bg-white p-6 rounded-xl shadow-lg border-t-4 border-yellow-400">
        <h3 class="text-sm font-semibold text-gray-500">Graduated</h3>
        <p class="text-4xl font-bold text-yellow-500 mt-2">--</p>
      </div>
      <div class="bg-white p-6 rounded-xl shadow-lg border-t-4 border-purple-500">
        <h3 class="text-sm font-semibold text-gray-500">Total Fees</h3>
        <p class="text-4xl font-bold text-purple-600 mt-2">₹<?= number_format($totalFees) ?></p>
      </div>
    </div>

    <!-- Activity and Summary -->
    <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
      <?php if ($adminRole === 'full'): ?>
      <div class="bg-white p-6 rounded-xl shadow">
        <h3 class="text-xl font-semibold mb-4 text-gray-800">Recent Activity</h3>
        <ul class="text-sm text-gray-700 list-disc list-inside space-y-2 overflow-y-auto max-h-64">
          <?php if (count($recentLogs)): ?>
            <?php foreach ($recentLogs as $log): ?>
              <li>
                <strong><?= htmlspecialchars($log['full_name']) ?></strong> - 
                <?= htmlspecialchars($log['action_desc']) ?> by 
                <em><?= htmlspecialchars($log['admin_user'] ?? 'Unknown') ?></em> on 
                <?= date("d M Y, h:i A", strtotime($log['activity_time'])) ?>
              </li>
            <?php endforeach; ?>
          <?php else: ?>
            <li>No recent activity found.</li>
          <?php endif; ?>
        </ul>
      </div>
      <?php endif; ?>

      <!-- Result Summary with Chart -->
      <div class="bg-white p-6 rounded-xl shadow">
        <h3 class="text-xl font-semibold mb-4 text-gray-800">Result Summary</h3>
        <canvas id="resultChart" class="w-full" height="200"></canvas>
        <script>
          const ctx = document.getElementById('resultChart').getContext('2d');
          new Chart(ctx, {
            type: 'bar',
            data: {
              labels: <?= json_encode(array_column($resultSummary, 'grade')) ?>,
              datasets: [{
                label: '% Pass Rate',
                data: <?= json_encode(array_map(function($r) {
                    return $r['total_students'] > 0 ? round(($r['passed_students'] / $r['total_students']) * 100, 2) : 0;
                }, $resultSummary)) ?>,
                backgroundColor: 'rgba(99, 102, 241, 0.5)',
                borderColor: 'rgba(99, 102, 241, 1)',
                borderWidth: 1
              }]
            },
            options: {
              scales: {
                y: { beginAtZero: true, max: 100 }
              }
            }
          });
        </script>
      </div>
    </div>
  </main>
</div>

<script>
  function toggleDropdown() {
    document.getElementById("dropdownMenu").classList.toggle("hidden");
  }

  document.addEventListener('click', function (e) {
    const dropdown = document.getElementById("dropdownMenu");
    if (!e.target.closest('#dropdownMenu') && !e.target.closest('button')) {
      dropdown.classList.add('hidden');
    }
  });
</script>
</body>
</html>

