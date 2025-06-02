<?php
session_start();
require 'connect.php';

if (!isset($_SESSION['admin_id'])) {
    header("Location: login.php");
    exit;
}

$adminUsername = htmlspecialchars($_SESSION['admin_username'] ?? 'Admin');
$adminRole = $_SESSION['admin_role'] ?? 'full';

$selectedGrade = $_GET['grade'] ?? '';
$selectedDate = $_GET['date'] ?? date('Y-m-d');
$grades = range(1, 10);

$students = [];
$attendanceAlreadyMarked = false;

if ($selectedGrade !== '') {
    $checkStmt = $pdo->prepare("SELECT COUNT(*) FROM attendance a INNER JOIN students s ON a.student_id = s.id WHERE a.attendance_date = ? AND s.grade = ?");
    $checkStmt->execute([$selectedDate, $selectedGrade]);
    $attendanceAlreadyMarked = $checkStmt->fetchColumn() > 0;

    $stmt = $pdo->prepare("SELECT * FROM students WHERE grade = ? AND is_deleted = 0 ORDER BY full_name");
    $stmt->execute([$selectedGrade]);
    $students = $stmt->fetchAll();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Mark Attendance</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
  <style>
    .status-btn input[type=radio] { display: none; }
    .status-btn label {
      cursor: pointer;
      padding: 0.3rem 0.7rem;
      font-weight: 600;
      font-size: 0.875rem;
      border-radius: 0.5rem;
      transition: all 0.2s ease;
    }
    .status-btn input[type=radio]:checked + label.p { background-color: #10b981; color: white; }
    .status-btn input[type=radio]:checked + label.a { background-color: #ef4444; color: white; }
    .status-btn input[type=radio]:checked + label.l { background-color: #f59e0b; color: white; }
    #popup {
      display: none;
      position: fixed;
      top: 20px;
      right: 20px;
      background: #16a34a;
      color: white;
      padding: 12px 20px;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      z-index: 9999;
    }
  </style>
</head>
<body class="bg-gradient-to-br from-blue-100 to-white font-sans min-h-screen">
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
        <li><a href="attendance.php" class="flex items-center gap-3 px-4 py-3 <?= active('attendance.php') ?>"><i class="fas fa-calendar-check"></i><span>Mark Attendance</span></a></li>
        <li><a href="view_attendance.php" class="flex items-center gap-3 px-4 py-3 <?= active('view_attendance.php') ?>"><i class="fas fa-calendar-alt"></i><span>View Attendance</span></a></li>
        <li><a href="logout.php" class="flex items-center gap-3 px-4 py-3 text-red-400 hover:text-red-200"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a></li>
      </ul>
    </nav>
  </aside>

  <!-- Main Content -->
  <main class="flex-1 p-4 sm:p-8">
    <div id="popup">✅ Attendance saved successfully!</div>

    <!-- Header -->
    <header class="flex flex-col sm:flex-row justify-between items-start sm:items-center bg-white shadow p-4 rounded-md mb-6 gap-4">
      <h2 class="text-2xl font-bold text-gray-800">📋 Attendance</h2>
      <a href="admin_dashboard.php" class="bg-gray-800 text-white px-4 py-2 rounded shadow hover:bg-gray-700">← Back</a>
    </header>

    <!-- Grade Selection with Fancy Cards -->
    <?php if (!$selectedGrade): ?>
      <div class="bg-white p-6 rounded-xl shadow mb-6">
        <h2 class="text-xl font-semibold text-gray-800 mb-4">Select a Grade to Mark Attendance</h2>
        <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-6">
          <?php foreach ($grades as $grade): ?>
            <a href="attendance.php?grade=<?= $grade ?>&date=<?= date('Y-m-d') ?>"
               class="transition transform hover:-translate-y-1 hover:shadow-lg duration-200 text-center rounded-2xl px-6 py-8 bg-gradient-to-br from-blue-100 to-blue-200 hover:from-indigo-300 hover:to-indigo-400 border border-blue-300">
              <i class="fas fa-users text-3xl text-indigo-700 mb-3"></i>
              <div class="text-2xl font-bold text-indigo-800">Grade <?= $grade ?></div>
            </a>
          <?php endforeach; ?>
        </div>
      </div>
    <?php else: ?>
      <!-- Filters -->
      <form method="GET" class="flex flex-wrap gap-4 items-center bg-white p-4 rounded shadow mb-6">
        <div>
          <label class="text-sm font-semibold block mb-1">Selected Grade</label>
          <select name="grade" class="px-4 py-2 rounded border w-40 bg-gray-100" readonly>
            <option value="<?= $selectedGrade ?>">Grade <?= $selectedGrade ?></option>
          </select>
        </div>
        <div>
          <label class="text-sm font-semibold block mb-1">Select Date</label>
          <input type="date" name="date" value="<?= htmlspecialchars($selectedDate) ?>" onchange="this.form.submit()" class="px-4 py-2 rounded border w-40">
        </div>
      </form>
    <?php endif; ?>

    <!-- Attendance Form -->
    <?php if ($selectedGrade): ?>
      <?php if ($attendanceAlreadyMarked): ?>
        <div class="text-center text-red-600 font-semibold bg-red-100 border border-red-300 rounded p-4 mb-6">
          ⚠️ Attendance for Grade <?= htmlspecialchars($selectedGrade) ?> on <?= htmlspecialchars($selectedDate) ?> has already been marked.
        </div>
      <?php elseif ($students): ?>
        <form method="POST" action="save_attendance.php" onsubmit="showPopup()">
          <input type="hidden" name="grade" value="<?= htmlspecialchars($selectedGrade) ?>">
          <input type="hidden" name="date" value="<?= htmlspecialchars($selectedDate) ?>">

          <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-6">
            <?php foreach ($students as $student): ?>
              <div class="bg-white rounded-xl shadow p-4 text-center">
                <div class="w-20 h-20 mx-auto mb-3 rounded-full overflow-hidden border border-gray-300">
                  <?php if (!empty($student['profile_photo']) && file_exists($student['profile_photo'])): ?>
                    <img src="<?= htmlspecialchars($student['profile_photo']) ?>" alt="Photo" class="w-full h-full object-cover">
                  <?php else: ?>
                    <img src="https://ui-avatars.com/api/?name=<?= urlencode($student['full_name']) ?>&background=random" alt="Avatar" class="w-full h-full object-cover">
                  <?php endif; ?>
                </div>
                <h2 class="font-semibold text-gray-800 text-lg truncate" title="<?= htmlspecialchars($student['full_name']) ?>">
                  <?= htmlspecialchars($student['full_name']) ?>
                </h2>
                <p class="text-gray-500 text-sm mb-3">Roll: <?= htmlspecialchars($student['roll_number']) ?></p>

                <div class="status-btn flex justify-center gap-2">
                  <input type="radio" name="attendance[<?= $student['id'] ?>]" id="p<?= $student['id'] ?>" value="Present" required>
                  <label for="p<?= $student['id'] ?>" class="p bg-green-100 text-green-700">P</label>

                  <input type="radio" name="attendance[<?= $student['id'] ?>]" id="a<?= $student['id'] ?>" value="Absent">
                  <label for="a<?= $student['id'] ?>" class="a bg-red-100 text-red-700">A</label>

                  <input type="radio" name="attendance[<?= $student['id'] ?>]" id="l<?= $student['id'] ?>" value="Late">
                  <label for="l<?= $student['id'] ?>" class="l bg-yellow-100 text-yellow-700">L</label>
                </div>
              </div>
            <?php endforeach; ?>
          </div>

          <div class="text-center mt-8">
            <button type="submit" class="bg-blue-600 text-white px-8 py-3 rounded-full text-lg font-semibold hover:bg-blue-700 shadow-lg">
              ✅ Save Attendance
            </button>
          </div>
        </form>
      <?php elseif ($selectedGrade): ?>
        <p class="text-center text-gray-600 mt-10">No students found in this grade.</p>
      <?php endif; ?>
    <?php endif; ?>
  </main>
</div>

<script>
  function showPopup() {
    const popup = document.getElementById("popup");
    popup.style.display = "block";
    setTimeout(() => {
      popup.style.display = "none";
    }, 1000);
  }
</script>
</body>
</html>
