<?php
session_start();
require 'connect.php';

if (!isset($_SESSION['admin_id'])) {
    header("Location: login.php");
    exit;
}

$logs = $pdo->query("
  SELECT al.*, s.full_name AS student_name, a.username AS admin_username
  FROM activity_log al
  JOIN students s ON al.student_id = s.id
  LEFT JOIN admin a ON al.admin_id = a.id
  ORDER BY al.created_at DESC
")->fetchAll();
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Activity Logs</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body class="bg-gray-100 font-sans">
<div class="flex">
  <aside class="w-64 bg-blue-900 text-white min-h-screen p-5">
    <div class="text-2xl font-extrabold mb-8">Student<span class="text-yellow-300">Admin</span></div>
    <nav class="space-y-3 text-base font-medium">
      <a href="admin_dashboard.php" class="flex items-center gap-3 px-4 py-2 rounded hover:bg-blue-800">
        <i class="fas fa-home"></i> Dashboard
      </a>
      <a href="activity_log.php" class="flex items-center gap-3 px-4 py-2 rounded bg-blue-800">
        <i class="fas fa-list"></i> Activity Logs
      </a>
    </nav>
  </aside>

  <main class="flex-1 p-8">
    <div class="bg-white rounded-xl shadow-lg p-6">
      <div class="flex justify-between items-center mb-6">
        <h2 class="text-2xl font-bold text-indigo-700">🧾 Activity Logs</h2>
        <a href="admin_dashboard.php" class="bg-gray-700 text-white px-4 py-2 rounded hover:bg-gray-800">
          ← Back
        </a>
      </div>

      <div class="overflow-x-auto bg-white rounded shadow-md">
        <table class="min-w-full text-sm text-gray-700">
          <thead class="bg-indigo-100 text-center">
            <tr>
              <th class="px-4 py-2">Date</th>
              <th class="px-4 py-2">Student</th>
              <th class="px-4 py-2">Action</th>
              <th class="px-4 py-2">Description</th>
              <th class="px-4 py-2">Admin</th>
            </tr>
          </thead>
          <tbody>
            <?php if (count($logs)): ?>
              <?php foreach ($logs as $log): ?>
                <tr class="hover:bg-gray-50 border-b text-center">
                  <td class="px-4 py-2 text-sm text-gray-600">
                    <?= date("d M Y, h:i A", strtotime($log['created_at'])) ?>
                  </td>
                  <td class="px-4 py-2 font-medium">
                    <?= htmlspecialchars($log['student_name']) ?>
                  </td>
                  <td class="px-4 py-2 text-blue-700 font-semibold">
                    <?= htmlspecialchars($log['action']) ?>
                  </td>
                  <td class="px-4 py-2 text-gray-700">
                    <?= htmlspecialchars($log['description']) ?>
                  </td>
                  <td class="px-4 py-2 text-indigo-600 font-semibold">
                    <?= htmlspecialchars($log['admin_username']) ?>
                  </td>
                </tr>
              <?php endforeach; ?>
            <?php else: ?>
              <tr><td colspan="5" class="text-center py-4 text-gray-500">No activity logs found.</td></tr>
            <?php endif; ?>
          </tbody>
        </table>
      </div>
    </div>
  </main>
</div>
</body>
</html>
