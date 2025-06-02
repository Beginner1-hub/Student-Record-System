<?php
session_start();
include 'connect.php';

$selectedGrade = $_GET['grade'] ?? '';
$selectedMonth = $_GET['month'] ?? '';
$search = $_GET['search'] ?? '';
$showOnlyDeleted = isset($_GET['show_deleted']) ? true : false;

$grades = range(1, 10);
$months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

$query = "
  SELECT students.full_name, students.grade, students.section, students.roll_number,
         r.marks_obtained, r.max_marks, r.percentage, r.grade AS result_grade, r.remarks, r.exam_type, r.changed_at,
         r.month, a.username AS admin_username
  FROM result_log r
  JOIN students ON r.student_id = students.id
  LEFT JOIN admin a ON r.admin_id = a.id
  WHERE students.is_deleted = 0";

$params = [];
if ($selectedGrade) {
    $query .= " AND students.grade = ?";
    $params[] = $selectedGrade;
}
if ($selectedMonth) {
    $query .= " AND r.month = ?";
    $params[] = $selectedMonth;
}
if ($search) {
    $query .= " AND (students.full_name LIKE ? OR students.roll_number LIKE ?)";
    $params[] = "%$search%";
    $params[] = "%$search%";
}
if ($showOnlyDeleted) {
    $query .= " AND LOWER(r.remarks) = 'deleted'";
}

$query .= " ORDER BY r.changed_at DESC";
$stmt = $pdo->prepare($query);
$stmt->execute($params);
$logs = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Monthly Result Summary</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
  <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
</head>
<body class="bg-gradient-to-br from-gray-100 to-white min-h-screen font-sans">
<div class="flex">
  <aside class="w-64 bg-blue-900 text-white min-h-screen p-5">
    <div class="text-2xl font-extrabold mb-8">Student<span class="text-yellow-300">Admin</span></div>
    <nav class="space-y-3 text-base font-medium">
      <a href="admin_dashboard.php" class="flex items-center gap-3 px-4 py-2 rounded hover:bg-blue-800">
        <i class="fas fa-home"></i> Dashboard
      </a>
      <a href="view_result_log.php" class="flex items-center gap-3 px-4 py-2 rounded bg-blue-800">
        <i class="fas fa-calendar"></i> Result History
      </a>
    </nav>
  </aside>

  <main class="flex-1 p-8">
    <div class="bg-white rounded-xl shadow-lg p-6">
      <div class="flex justify-between items-center mb-6">
        <h2 class="text-2xl font-bold text-indigo-700">Monthly Result Summary</h2>
        <a href="admin_dashboard.php" class="bg-gray-700 text-white px-4 py-2 rounded hover:bg-gray-800">← Back</a>
      </div>

      <form method="GET" class="flex flex-wrap gap-4 items-center mb-6">
        <select name="grade" class="border rounded px-3 py-2">
          <option value="">All Grades</option>
          <?php foreach ($grades as $g): ?>
            <option value="<?= $g ?>" <?= $selectedGrade == $g ? 'selected' : '' ?>>Grade <?= $g ?></option>
          <?php endforeach; ?>
        </select>

        <select name="month" class="border rounded px-3 py-2">
          <option value="">All Months</option>
          <?php foreach ($months as $month): ?>
            <option value="<?= $month ?>" <?= $selectedMonth == $month ? 'selected' : '' ?>><?= $month ?></option>
          <?php endforeach; ?>
        </select>

        <input type="text" name="search" placeholder="Search by name or roll no" value="<?= htmlspecialchars($search) ?>" class="border rounded px-3 py-2" />

        <label class="flex items-center space-x-2">
          <input type="checkbox" name="show_deleted" value="1" <?= $showOnlyDeleted ? 'checked' : '' ?> onchange="this.form.submit()">
          <span>Show only deleted</span>
        </label>

        <button type="submit" class="bg-indigo-600 text-white px-4 py-2 rounded shadow">Filter</button>
      </form>

      <div class="overflow-x-auto bg-white rounded shadow-md">
        <table id="logTable" class="min-w-full text-sm text-center">
          <thead class="bg-indigo-100">
            <tr>
              <th class="px-3 py-2">Student</th>
              <th class="px-3 py-2">Grade</th>
              <th class="px-3 py-2">Section</th>
              <th class="px-3 py-2">Roll No</th>
              <th class="px-3 py-2">Marks</th>
              <th class="px-3 py-2">%</th>
              <th class="px-3 py-2">Grade</th>
              <th class="px-3 py-2">Remarks</th>
              <th class="px-3 py-2">Exam</th>
              <th class="px-3 py-2">Month</th>
              <th class="px-3 py-2">Changed By</th>
              <th class="px-3 py-2">Date</th>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($logs as $log): ?>
              <tr class="hover:bg-gray-50 <?= strtolower($log['remarks']) === 'deleted' ? 'bg-red-100 text-red-600' : '' ?>">
                <td class="border px-3 py-2 font-medium text-left"><?= htmlspecialchars($log['full_name']) ?></td>
                <td class="border px-3 py-2"><?= $log['grade'] ?></td>
                <td class="border px-3 py-2"><?= $log['section'] ?></td>
                <td class="border px-3 py-2"><?= $log['roll_number'] ?></td>
                <td class="border px-3 py-2"><?= $log['marks_obtained'] ?>/<?= $log['max_marks'] ?></td>
                <td class="border px-3 py-2"><?= $log['percentage'] ?>%</td>
                <td class="border px-3 py-2"><?= $log['result_grade'] ?></td>
                <td class="border px-3 py-2"><?= $log['remarks'] ?></td>
                <td class="border px-3 py-2"><?= ucfirst($log['exam_type']) ?></td>
                <td class="border px-3 py-2"><?= $log['month'] ?></td>
                <td class="border px-3 py-2 text-indigo-600 font-semibold"><?= htmlspecialchars($log['admin_username'] ?? 'Unknown') ?></td>
                <td class="border px-3 py-2 text-xs text-gray-600"><?= date('d M Y, H:i', strtotime($log['changed_at'])) ?></td>
              </tr>
            <?php endforeach; ?>
          </tbody>
        </table>
        <?php if (!count($logs)): ?>
          <p class="text-center py-4 text-gray-500">No results found for selected filters.</p>
        <?php endif; ?>
      </div>
    </div>
  </main>
</div>

<script>
  $(document).ready(function () {
    $('#logTable').DataTable({
      pageLength: 10,
      order: [[11, 'desc']],
      columnDefs: [
        { targets: [11], type: 'datetime' }
      ]
    });
  });
</script>
</body>
</html>
