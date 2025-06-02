<?php
include 'connect.php';

$selectedGrade = $_GET['grade'] ?? '';
$selectedMonth = $_GET['month'] ?? 'General';

$grades = range(1, 10);
$months = ["General", "January", "February", "March", "April", "May", "June",
           "July", "August", "September", "October", "November", "December"];

$query = "
  SELECT students.*, r.id AS result_id, r.subject, r.marks_obtained, r.max_marks, r.percentage, r.grade AS result_grade, r.remarks, r.exam_type, r.month
  FROM students
  LEFT JOIN result r ON students.id = r.student_id AND r.month = ?
  WHERE students.is_deleted = 0";

$params = [$selectedMonth];
if ($selectedGrade) {
    $query .= " AND students.grade = ?";
    $params[] = $selectedGrade;
}

$query .= " ORDER BY students.section, students.full_name";
$stmt = $pdo->prepare($query);
$stmt->execute($params);
$students = $stmt->fetchAll();

$grouped = [];
foreach ($students as $student) {
    $grouped[$student['section']][] = $student;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Result Management</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body class="bg-gray-100 font-sans">
<div class="flex">
  <aside class="w-64 bg-blue-900 text-white min-h-screen p-5">
    <div class="text-2xl font-extrabold mb-8">Student<span class="text-yellow-300">Admin</span></div>
    <nav class="space-y-3 text-base font-medium">
      <a href="admin_dashboard.php" class="flex items-center gap-3 px-4 py-2 rounded hover:bg-blue-800">
        <i class="fas fa-home"></i> Dashboard
      </a>
      <a href="result_select_grade.php" class="flex items-center gap-3 px-4 py-2 rounded bg-blue-800">
        <i class="fas fa-chart-bar"></i> Results
      </a>
      <a href="view_result_log.php" class="flex items-center gap-3 px-4 py-2 rounded hover:bg-blue-800">
        <i class="fas fa-history"></i> Result History
      </a>
    </nav>
  </aside>

  <main class="flex-1 p-8">
    <div class="bg-white rounded-xl shadow-lg p-6">
      <div class="flex justify-between items-center mb-6">
        <h2 class="text-2xl font-bold text-indigo-700">Result Management - Grade <?= htmlspecialchars($selectedGrade) ?></h2>
        <div class="space-x-2">
          <form method="GET" class="inline-block">
            <input type="hidden" name="grade" value="<?= htmlspecialchars($selectedGrade) ?>">
            <select name="month" onchange="this.form.submit()" class="px-4 py-2 border rounded shadow">
              <?php foreach ($months as $month): ?>
                <option value="<?= $month ?>" <?= $selectedMonth === $month ? 'selected' : '' ?>><?= $month ?></option>
              <?php endforeach; ?>
            </select>
          </form>
          <a href="result_select_grade.php" class="bg-gray-600 text-white px-4 py-2 rounded hover:bg-gray-700">← Back</a>
        </div>
      </div>

      <form id="resultForm" method="POST" action="save_results.php">
        <input type="hidden" name="grade" value="<?= htmlspecialchars($selectedGrade) ?>">
        <input type="hidden" name="month" value="<?= htmlspecialchars($selectedMonth) ?>">

        <?php foreach ($grouped as $section => $records): ?>
          <h3 class="text-lg font-semibold text-gray-700 mt-6 mb-2">Section <?= $section ?></h3>
          <div class="overflow-x-auto mb-6">
            <table class="w-full border text-sm">
              <thead class="bg-indigo-100">
                <tr>
                  <th class="px-3 py-2 border">#</th>
                  <th class="px-3 py-2 border">Student</th>
                  <th class="px-3 py-2 border">Roll</th>
                  <th class="px-3 py-2 border">Marks</th>
                  <th class="px-3 py-2 border">%</th>
                  <th class="px-3 py-2 border">Grade</th>
                  <th class="px-3 py-2 border">Remarks</th>
                  <th class="px-3 py-2 border">Exam</th>
                  <th class="px-3 py-2 border">Action</th>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($records as $sn => $s): ?>
                <tr class="hover:bg-gray-50" data-id="<?= $s['id'] ?>">
                  <td class="border px-3 py-2"><?= $sn + 1 ?></td>
                  <td class="border px-3 py-2 text-left"><?= htmlspecialchars($s['full_name']) ?></td>
                  <td class="border px-3 py-2"><?= $s['roll_number'] ?></td>
                  <td class="border px-3 py-2">
                    <input type="number" name="results[<?= $s['id'] ?>][marks_obtained]" class="w-24 px-2 py-1 border rounded text-right marks" value="<?= $s['marks_obtained'] ?? '' ?>" max="700">
                  </td>
                  <td class="border px-3 py-2 percent"><?= isset($s['percentage']) ? $s['percentage'] . '%' : '—' ?></td>
                  <td class="border px-3 py-2">
                    <input type="text" name="results[<?= $s['id'] ?>][grade]" class="w-20 px-2 py-1 border rounded text-center grade" value="<?= $s['result_grade'] ?? '' ?>">
                  </td>
                  <td class="border px-3 py-2">
                    <input type="text" name="results[<?= $s['id'] ?>][remarks]" class="w-full px-2 py-1 border rounded remarks" value="<?= $s['remarks'] ?? '' ?>">
                  </td>
                  <td class="border px-3 py-2">
                    <select name="results[<?= $s['id'] ?>][exam_type]" class="px-2 py-1 border rounded exam">
                      <option value="online" <?= ($s['exam_type'] ?? '') === 'online' ? 'selected' : '' ?>>Online</option>
                      <option value="physical" <?= ($s['exam_type'] ?? '') === 'physical' ? 'selected' : '' ?>>Physical</option>
                    </select>
                  </td>
                  <td class="border px-3 py-2 text-center space-x-1">
                    <button type="submit" name="single_save" value="<?= $s['id'] ?>" class="bg-green-600 text-white px-3 py-1 rounded hover:bg-green-700 text-sm">Save</button>
                    <button type="button" class="delete-btn bg-red-600 text-white px-2 py-1 rounded hover:bg-red-700 text-sm">🗑</button>
                  </td>
                </tr>
                <?php endforeach; ?>
              </tbody>
            </table>
          </div>
        <?php endforeach; ?>

        <div class="text-right mt-4 space-x-2">
          <button type="submit" class="bg-blue-600 text-white px-6 py-2 rounded shadow hover:bg-blue-700">📂 Save All</button>
          <button onclick="window.print(); return false;" type="button" class="bg-purple-600 text-white px-6 py-2 rounded shadow hover:bg-purple-700">🖨 Print View</button>
          <a href="export_results_pdf.php?grade=<?= urlencode($selectedGrade) ?>&month=<?= urlencode($selectedMonth) ?>" download class="bg-red-600 text-white px-6 py-2 rounded shadow hover:bg-red-700">📄 Export PDF</a>
        </div>
      </form>
    </div>
  </main>
</div>

<?php if (isset($_GET['success'])): ?>
<div id="popup" class="fixed bottom-6 right-6 bg-green-500 text-white px-4 py-2 rounded shadow-lg">Saved Successfully!</div>
<script>
  setTimeout(() => document.getElementById("popup").remove(), 1500);
</script>
<?php endif; ?>

<script>
$(document).on('input', '.marks', function () {
  const row = $(this).closest('tr');
  const marks = parseFloat($(this).val());
  const maxMarks = 700;
  if (marks > maxMarks) {
    alert('Marks cannot exceed ' + maxMarks);
    $(this).val('');
    row.find('.grade').val('');
    row.find('.remarks').val('');
    row.find('.percent').text('—');
    return;
  }
  const percent = (marks / maxMarks) * 100;
  row.find('.percent').text(percent.toFixed(2) + '%');
  let grade = '', remarks = '';
  if (percent >= 90) { grade = 'A+'; remarks = 'Outstanding'; }
  else if (percent >= 80) { grade = 'A'; remarks = 'Excellent'; }
  else if (percent >= 70) { grade = 'B'; remarks = 'Very Good'; }
  else if (percent >= 60) { grade = 'C'; remarks = 'Good'; }
  else if (percent >= 50) { grade = 'D'; remarks = 'Average'; }
  else { grade = 'F'; remarks = 'Needs Improvement'; }
  row.find('.grade').val(grade);
  row.find('.remarks').val(remarks);
});

$(document).on('click', '.delete-btn', function () {
  if (!confirm("Are you sure you want to delete this result?")) return;

  const row = $(this).closest('tr');
  const studentId = row.data('id');
  const month = "<?= $selectedMonth ?>";
  const grade = "<?= $selectedGrade ?>";

  $.post('delete_result.php', { student_id: studentId, month: month, grade: grade }, function (res) {
    if (res.success) {
      row.remove();
      showPopup("Result deleted!");
    } else {
      alert(res.message);
    }
  }, 'json');
});

function showPopup(message) {
  const popup = $("<div>")
    .text(message)
    .addClass("fixed bottom-6 right-6 bg-green-500 text-white px-4 py-2 rounded shadow-lg z-50")
    .appendTo("body");

  setTimeout(() => popup.fadeOut(() => popup.remove()), 1500);
}
</script>
</body>
</html>
