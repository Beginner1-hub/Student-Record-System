<?php
session_start();
require 'connect.php';

if (!isset($_SESSION['admin_id'])) {
    header("Location: login.php");
    exit;
}

$adminUsername = htmlspecialchars($_SESSION['admin_username'] ?? 'Admin');
$adminRole = $_SESSION['admin_role'] ?? 'full';

$gradeFilter = $_GET['grade'] ?? '';
$monthFilter = $_GET['month'] ?? '';

$months = ['January', 'February', 'March', 'April', 'May', 'June',
           'July', 'August', 'September', 'October', 'November', 'December'];

$query = "
    SELECT students.id, students.full_name, students.roll_number, students.grade, students.section,
           f.id AS fee_id, f.month, f.total_fee, f.amount_paid, f.status, f.created_at
    FROM fees f
    JOIN students ON f.student_id = students.id
    WHERE 1
";
$params = [];

if ($gradeFilter !== '') {
    $query .= " AND students.grade = ?";
    $params[] = $gradeFilter;
}
if ($monthFilter !== '') {
    $query .= " AND f.month = ?";
    $params[] = $monthFilter;
}
$query .= " ORDER BY f.created_at DESC";

$stmt = $pdo->prepare($query);
$stmt->execute($params);
$fees = $stmt->fetchAll();

$grades = $pdo->query("SELECT DISTINCT grade FROM students ORDER BY grade ASC")->fetchAll(PDO::FETCH_COLUMN);
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Student Fee Records</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 font-sans">
<div class="flex">
  <!-- Sidebar -->
  <aside class="w-64 bg-blue-900 text-white p-5 min-h-screen shadow-xl">
    <div class="text-center mb-10">
      <h1 class="text-3xl font-extrabold">Student<span class="text-yellow-300">Admin</span></h1>
    </div>
    <nav>
      <ul class="space-y-3 text-base font-medium">
        <?php function active($file) { return basename($_SERVER['PHP_SELF']) === $file ? 'bg-gradient-to-r from-blue-700 to-indigo-800 font-semibold shadow rounded-lg' : 'hover:bg-white/10 rounded'; } ?>
        <li><a href="admin_dashboard.php" class="flex items-center gap-3 px-4 py-3 <?= active('admin_dashboard.php') ?>"><i class="fas fa-home"></i><span>Dashboard</span></a></li>
        <li><a href="view_student_fees.php" class="flex items-center gap-3 px-4 py-3 <?= active('view_student_fees.php') ?>"><i class="fas fa-money-check-alt"></i><span>Student Fees Management</span></a></li>
        <li><a href="logout.php" class="flex items-center gap-3 px-4 py-3 text-red-400 hover:text-red-200"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a></li>
      </ul>
    </nav>
  </aside>

  <!-- Main Content -->
  <main class="flex-1 p-6">
    <div class="bg-white rounded-lg shadow p-6 mb-6">
      <div class="flex justify-between items-center mb-4">
        <h2 class="text-2xl font-bold text-indigo-700 flex items-center gap-2"><i class="fas fa-coins"></i> Student Fee Records</h2>
        <div class="flex gap-3">
          <a href="admin_dashboard.php" class="inline-flex items-center px-4 py-2 bg-gray-700 text-white rounded-md hover:bg-gray-800 text-sm"><i class="fas fa-arrow-left mr-2"></i>Dashboard</a>
          <button onclick="openModal()" class="inline-flex items-center px-4 py-2 bg-green-600 text-white rounded-md hover:bg-green-700 text-sm shadow">
            <i class="fas fa-plus-circle mr-2"></i>Add Fee
          </button>
        </div>
      </div>

      <!-- Filters -->
      <form method="GET" class="flex flex-wrap gap-4 items-end mb-4">
        <div>
          <label class="block text-sm font-semibold text-gray-600 mb-1">Select Grade</label>
          <select name="grade" class="w-48 px-3 py-2 border rounded shadow text-sm">
            <option value="">All Grades</option>
            <?php for ($i = 1; $i <= 10; $i++): ?>
              <option value="<?= $i ?>" <?= $gradeFilter == $i ? 'selected' : '' ?>>Grade <?= $i ?></option>
            <?php endfor; ?>
          </select>
        </div>
        <div>
          <label class="block text-sm font-semibold text-gray-600 mb-1">Select Month</label>
          <select name="month" class="w-48 px-3 py-2 border rounded shadow text-sm">
            <option value="">All Months</option>
            <?php foreach ($months as $month): ?>
              <option value="<?= $month ?>" <?= $monthFilter == $month ? 'selected' : '' ?>><?= $month ?></option>
            <?php endforeach; ?>
          </select>
        </div>
        <div class="pt-5">
          <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-md text-sm">Filter</button>
        </div>
      </form>

      <!-- Table -->
      <div class="overflow-x-auto">
        <table class="w-full text-sm border border-gray-200 bg-white rounded shadow">
          <thead class="bg-indigo-100 text-indigo-800 font-semibold">
            <tr>
              <th class="border px-3 py-2">Sl No.</th>
              <th class="border px-3 py-2">Month</th>
              <th class="border px-3 py-2">Student</th>
              <th class="border px-3 py-2">Roll No.</th>
              <th class="border px-3 py-2">Grade</th>
              <th class="border px-3 py-2">Section</th>
              <th class="border px-3 py-2">Amount Paid</th>
              <th class="border px-3 py-2">Status</th>
              <th class="border px-3 py-2">Date</th>
              <th class="border px-3 py-2">Actions</th>
            </tr>
          </thead>
          <tbody class="text-gray-700">
            <?php if (!empty($fees)): ?>
              <?php $sn = 1; foreach ($fees as $fee): ?>
                <tr class="hover:bg-gray-50">
                  <td class="border px-3 py-2"><?= $sn++; ?></td>
                  <td class="border px-3 py-2"><?= $fee['month']; ?></td>
                  <td class="border px-3 py-2"><?= $fee['full_name']; ?></td>
                  <td class="border px-3 py-2"><?= $fee['roll_number']; ?></td>
                  <td class="border px-3 py-2"><?= $fee['grade']; ?></td>
                  <td class="border px-3 py-2"><?= $fee['section']; ?></td>
                  <td class="border px-3 py-2">₹<?= number_format($fee['amount_paid'], 2); ?></td>
                  <td class="border px-3 py-2">
                    <span class="px-2 py-1 rounded-full text-white text-xs <?= $fee['status'] === 'paid' ? 'bg-green-500' : 'bg-yellow-500' ?>">
                      <?= ucfirst($fee['status']); ?>
                    </span>
                  </td>
                  <td class="border px-3 py-2"><?= date('d M Y', strtotime($fee['created_at'])); ?></td>
                  <td class="border px-3 py-2 space-x-2">
                    <a href="generate_fee_receipt.php?fee_id=<?= $fee['fee_id']; ?>" title="View">📄</a>
                    <a href="edit_fee.php?id=<?= $fee['fee_id']; ?>" title="Edit">✏️</a>
                    <a href="delete_fee.php?id=<?= $fee['fee_id']; ?>" onclick="return confirm('Delete this fee record?');" title="Delete">🗑️</a>
                  </td>
                </tr>
              <?php endforeach; ?>
            <?php else: ?>
              <tr><td colspan="10" class="text-center py-6 text-gray-500">No records found.</td></tr>
            <?php endif; ?>
          </tbody>
        </table>
      </div>
    </div>
  </main>
</div>

<!-- Add Fee Modal -->
<div id="addFeeModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 hidden">
  <div class="bg-white rounded-xl p-6 w-full max-w-md shadow-xl relative">
    <h3 class="text-xl font-semibold mb-4 text-gray-700">Add New Fee Record</h3>
    <form method="POST" action="insert_fee.php" onsubmit="return reloadAfterSubmit();">
      <div class="mb-3">
        <label class="block text-sm font-medium">Grade</label>
        <select name="modal_grade" id="modal_grade" required class="w-full mt-1 px-4 py-2 border rounded-md text-sm" onchange="fetchStudentsByGrade(this.value)">
          <option value="">-- Select Grade --</option>
          <?php foreach ($grades as $g): ?>
            <option value="<?= $g ?>">Grade <?= $g ?></option>
          <?php endforeach; ?>
        </select>
      </div>
      <div class="mb-3">
        <label class="block text-sm font-medium">Student</label>
        <select name="student_id" id="modal_student" required class="w-full mt-1 px-4 py-2 border rounded-md text-sm">
          <option value="">-- Select Student --</option>
        </select>
      </div>
      <div class="mb-3">
        <label class="block text-sm font-medium">Month</label>
        <select name="month" required class="w-full mt-1 px-4 py-2 border rounded-md text-sm">
          <?php foreach ($months as $m): ?>
            <option value="<?= $m ?>"><?= $m ?></option>
          <?php endforeach; ?>
        </select>
      </div>
      <div class="mb-3">
        <label class="block text-sm font-medium">Total Fee</label>
        <input type="number" name="total_fee" required class="w-full mt-1 px-4 py-2 border rounded-md text-sm">
      </div>
      <div class="mb-3">
        <label class="block text-sm font-medium">Amount Paid</label>
        <input type="number" name="amount_paid" required class="w-full mt-1 px-4 py-2 border rounded-md text-sm">
      </div>
      <div class="mb-4">
        <label class="block text-sm font-medium">Status</label>
        <select name="status" required class="w-full mt-1 px-4 py-2 border rounded-md text-sm">
          <option value="paid">Paid</option>
          <option value="unpaid">Unpaid</option>
        </select>
      </div>
      <div class="flex justify-end gap-2">
        <button type="button" onclick="document.getElementById('addFeeModal').classList.add('hidden')" class="px-4 py-2 text-sm border rounded-md hover:bg-gray-100">Cancel</button>
        <button type="submit" class="bg-green-600 text-white px-4 py-2 text-sm rounded-md hover:bg-green-700">Save</button>
      </div>
    </form>
  </div>
</div>

<!-- Modal Script -->
<script>
  function fetchStudentsByGrade(grade) {
    fetch('get_students_by_grade.php?grade=' + grade)
      .then(res => res.json())
      .then(data => {
        const studentSelect = document.getElementById('modal_student');
        studentSelect.innerHTML = '<option value="">-- Select Student --</option>';
        data.forEach(student => {
          studentSelect.innerHTML += `<option value="${student.id}">${student.full_name} (Roll ${student.roll_number})</option>`;
        });
      });
  }

  function openModal() {
    document.getElementById('addFeeModal').classList.remove('hidden');
  }

  function reloadAfterSubmit() {
    setTimeout(() => {
      window.location.reload();
    }, 100);
    return true;
  }
</script>
</body>
</html>
