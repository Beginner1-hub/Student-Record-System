<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include 'connect.php';
session_start();
if (!isset($_SESSION['admin_id'])) {
    header("Location: login.php");
    exit;
}

if (!isset($_GET['id'])) {
    die('Student ID missing');
}

$id = $_GET['id'];
$gradeContext = $_GET['grade'] ?? '';

$stmt = $pdo->prepare("SELECT * FROM students WHERE id = ?");
$stmt->execute([$id]);
$student = $stmt->fetch();

if (!$student) {
    die('Student not found');
}

$feeStmt = $pdo->prepare("SELECT * FROM fees WHERE student_id = ?");
$feeStmt->execute([$id]);
$feeRecords = $feeStmt->fetchAll();

$resultStmt = $pdo->prepare("SELECT * FROM result WHERE student_id = ?");
$resultStmt->execute([$id]);
$results = $resultStmt->fetchAll();

// Attendance Summary
$attendanceStmt = $pdo->prepare("SELECT status FROM attendance WHERE student_id = ?");
$attendanceStmt->execute([$id]);
$attendanceRecords = $attendanceStmt->fetchAll();

$present = $absent = $late = 0;
foreach ($attendanceRecords as $att) {
    if ($att['status'] === 'Present') $present++;
    elseif ($att['status'] === 'Absent') $absent++;
    elseif ($att['status'] === 'Late') $late++;
}
$totalMarked = $present + $absent + $late;
$attendancePercentage = $totalMarked > 0 ? round(($present / $totalMarked) * 100, 2) : 'N/A';

$statusBadge = strtolower($student['status']) === 'active' 
    ? '<span class="inline-block bg-green-100 text-green-700 text-xs font-semibold px-3 py-1 rounded-full">Active</span>' 
    : '<span class="inline-block bg-red-100 text-red-700 text-xs font-semibold px-3 py-1 rounded-full">Inactive</span>';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Student Details</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
        }
    </style>
</head>
<body class="bg-gray-100 min-h-screen py-10 px-4">

<div class="max-w-5xl mx-auto">
    <div class="mb-6">
        <a href="view_students.php<?= $gradeContext ? '?grade=' . urlencode($gradeContext) : '' ?>" class="inline-block bg-blue-600 hover:bg-blue-700 text-white px-5 py-2 rounded-full shadow-md font-medium transition duration-200"><i class="fas fa-arrow-left mr-2"></i>Back to Student List</a>
    </div>

    <div class="bg-white rounded-2xl shadow-lg p-8 mb-10">
        <div class="flex flex-col md:flex-row items-center md:items-start">
            <div class="flex-shrink-0 w-36 h-36 bg-gray-200 rounded-full overflow-hidden mb-6 md:mb-0 md:mr-8">
                <?php if (!empty($student['profile_photo']) && file_exists($student['profile_photo'])): ?>
                    <img src="<?= $student['profile_photo']; ?>" alt="Photo" class="w-full h-full object-cover">
                <?php else: ?>
                    <div class="flex items-center justify-center h-full text-gray-600 font-semibold">No Photo</div>
                <?php endif; ?>
            </div>
            <div class="w-full">
                <div class="flex items-center justify-between">
                    <h2 class="text-3xl font-bold text-blue-700 mb-1"><?= htmlspecialchars($student['full_name']); ?></h2>
                    <?= $statusBadge; ?>
                </div>
                <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-3 text-sm text-gray-800 font-medium mt-4">
                    <p><strong>Grade:</strong> <?= $student['grade']; ?></p>
                    <p><strong>Section:</strong> <?= $student['section']; ?></p>
                    <p><strong>Roll Number:</strong> <?= $student['roll_number']; ?></p>
                    <p><strong>Gender:</strong> <?= $student['gender']; ?></p>
                    <p><strong>Age:</strong> <?= $student['age']; ?></p>
                    <p><strong>Date of Birth:</strong> <?= date('d M Y', strtotime($student['dob'])); ?></p>
                    <p><strong>Address:</strong> <?= htmlspecialchars($student['address']); ?></p>
                    <p><strong>Guardian Name:</strong> <?= htmlspecialchars($student['guardian_name']); ?></p>
                    <p><strong>Guardian Contact:</strong> <?= $student['guardian_contact']; ?></p>
                    <p><strong>Emergency Contact:</strong> <?= $student['emergency_contact']; ?></p>
                    <p><strong>Enrollment Date:</strong> <?= date('d M Y', strtotime($student['enrollment_date'])); ?></p>
                </div>
            </div>
        </div>
    </div>

    <div class="bg-white rounded-2xl shadow-lg p-8">
        <h3 class="text-2xl font-bold text-blue-700 mb-6 border-b pb-2">Fee Details</h3>
        <?php if (!empty($feeRecords)): ?>
            <div class="overflow-x-auto">
                <table class="min-w-full text-sm text-left border border-gray-200">
                    <thead class="bg-blue-100 text-blue-800 font-semibold uppercase">
                        <tr>
                            <th class="px-4 py-3 border">Month</th>
                            <th class="px-4 py-3 border">Total Fee</th>
                            <th class="px-4 py-3 border">Amount Paid</th>
                            <th class="px-4 py-3 border">Balance</th>
                            <th class="px-4 py-3 border">Status</th>
                        </tr>
                    </thead>
                    <tbody class="text-gray-700 font-medium">
                        <?php foreach ($feeRecords as $fee): ?>
                            <tr class="hover:bg-gray-50">
                                <td class="px-4 py-3 border"><?= htmlspecialchars($fee['month']); ?></td>
                                <td class="px-4 py-3 border">₹<?= number_format($fee['total_fee'], 2); ?></td>
                                <td class="px-4 py-3 border">₹<?= number_format($fee['amount_paid'], 2); ?></td>
                                <td class="px-4 py-3 border">₹<?= number_format($fee['total_fee'] - $fee['amount_paid'], 2); ?></td>
                                <td class="px-4 py-3 border">
                                    <span class="inline-block px-3 py-1 rounded-full text-xs font-semibold <?= $fee['status'] === 'paid' ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'; ?>">
                                        <?= ucfirst($fee['status']); ?>
                                    </span>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        <?php else: ?>
            <p class="text-gray-500 font-medium">No fee details available.</p>
        <?php endif; ?>
    </div>

    <div class="bg-white rounded-2xl shadow-lg p-8 mt-10">
        <div class="flex justify-between items-center mb-6">
            <h3 class="text-2xl font-bold text-blue-700 border-b pb-2">Exam Results</h3>
            <a href="export_student_results_pdf.php?student_id=<?= $id ?>" class="text-sm bg-red-600 hover:bg-red-700 text-white px-4 py-2 rounded shadow">🧾 Export PDF</a>
        </div>
        <?php if (!empty($results)): ?>
            <div class="overflow-x-auto">
                <table class="min-w-full text-sm text-left border border-gray-200">
                    <thead class="bg-purple-100 text-purple-800 font-semibold uppercase">
                        <tr>
                            <th class="px-4 py-3 border">Month</th>
                            <th class="px-4 py-3 border">Exam Type</th>
                            <th class="px-4 py-3 border">Marks Obtained</th>
                            <th class="px-4 py-3 border">Max Marks</th>
                            <th class="px-4 py-3 border">Percentage</th>
                            <th class="px-4 py-3 border">Grade</th>
                            <th class="px-4 py-3 border">Remarks</th>
                        </tr>
                    </thead>
                    <tbody class="text-gray-700 font-medium">
                        <?php foreach ($results as $res): ?>
                            <?php 
                                $percentage = ($res['max_marks'] > 0) ? ($res['marks_obtained'] / $res['max_marks']) * 100 : 0;
                                $month = isset($res['month']) ? $res['month'] : 'N/A';
                            ?>
                            <tr class="hover:bg-gray-50">
                                <td class="px-4 py-3 border"><?= htmlspecialchars($month); ?></td>
                                <td class="px-4 py-3 border"><?= ucfirst($res['exam_type']); ?></td>
                                <td class="px-4 py-3 border"><?= $res['marks_obtained']; ?></td>
                                <td class="px-4 py-3 border"><?= $res['max_marks']; ?></td>
                                <td class="px-4 py-3 border"><?= round($percentage, 2); ?>%</td>
                                <td class="px-4 py-3 border"><?= $res['grade']; ?></td>
                                <td class="px-4 py-3 border"><?= $res['remarks']; ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        <?php else: ?>
            <p class="text-gray-500 font-medium">No result records available.</p>
        <?php endif; ?>
    </div>

    <!-- ✅ Attendance Summary -->
    <div class="bg-white rounded-2xl shadow-lg p-8 mt-10">
        <h3 class="text-2xl font-bold text-blue-700 border-b pb-2 mb-4">📅 Attendance Summary</h3>
        <?php if ($totalMarked > 0): ?>
            <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6 text-center text-sm font-medium text-gray-700">
                <div class="bg-green-100 text-green-800 p-4 rounded-lg shadow">✅ Present: <?= $present ?></div>
                <div class="bg-red-100 text-red-700 p-4 rounded-lg shadow">❌ Absent: <?= $absent ?></div>
                <div class="bg-yellow-100 text-yellow-700 p-4 rounded-lg shadow">⏰ Late: <?= $late ?></div>
                <div class="col-span-full bg-blue-100 text-blue-800 p-4 rounded-lg shadow mt-4">🎯 Attendance Percentage: <strong><?= $attendancePercentage ?>%</strong></div>
            </div>
            <div class="mt-4 text-center">
                <a href="view_attendance.php?grade=<?= $student['grade'] ?>&student_id=<?= $id ?>" class="text-blue-600 hover:underline text-sm inline-block">🔍 View Full Attendance</a>
            </div>
        <?php else: ?>
            <p class="text-gray-500">No attendance data available for this student.</p>
        <?php endif; ?>
    </div>
</div>

</body>
</html>
