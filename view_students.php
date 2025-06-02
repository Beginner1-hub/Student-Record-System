<?php
include 'connect.php';
session_start();

if (!isset($_SESSION['admin_id'])) {
    header("Location: login.php");
    exit;
}

$adminUsername = htmlspecialchars($_SESSION['admin_username'] ?? 'Admin');
$selectedGrade = isset($_GET['grade']) ? $_GET['grade'] : '';

$sql = "SELECT * FROM students WHERE is_deleted = 0";
if ($selectedGrade) {
    $sql .= " AND grade = :grade";
}
$sql .= " ORDER BY created_at DESC";
$stmt = $pdo->prepare($sql);

if ($selectedGrade) {
    $stmt->bindParam(':grade', $selectedGrade, PDO::PARAM_STR);
}

$stmt->execute();
$students = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Students</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
        }
        @media print {
            aside, .dataTables_filter, .dataTables_paginate, .dataTables_info, .dataTables_length, button {
                display: none !important;
            }
        }
    </style>
</head>
<body class="bg-gray-100 font-sans">
<div class="flex">
    <aside class="w-64 bg-blue-900 text-white p-5 min-h-screen shadow-xl">
        <div class="text-center mb-10">
            <h1 class="text-3xl font-extrabold">Student<span class="text-yellow-300">Admin</span></h1>
        </div>
        <nav>
            <ul class="space-y-3 text-base font-medium">
                <li><a href="admin_dashboard.php" class="flex items-center gap-3 px-4 py-3 hover:bg-white/10 rounded"><i class="fas fa-home"></i><span>Dashboard</span></a></li>
                <li><a href="view_students.php" class="flex items-center gap-3 px-4 py-3 bg-gradient-to-r from-blue-700 to-indigo-800 font-semibold shadow rounded-lg"><i class="fas fa-users"></i><span>View Students</span></a></li>
                <li><a href="logout.php" class="flex items-center gap-3 px-4 py-3 text-red-400 hover:text-red-200"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a></li>
            </ul>
        </nav>
    </aside>

    <main class="flex-1 p-8">
        <section class="mb-3 flex flex-wrap justify-between items-center gap-4 bg-white shadow-sm rounded-md p-4">
            <div class="flex flex-wrap items-center gap-3">
                <label for="gradeSelect" class="text-sm font-medium text-gray-600">Filter by Grade:</label>
                <select id="gradeSelect" class="px-4 py-2 border border-gray-300 rounded-md bg-white text-sm">
                    <option value="">All Grades</option>
                    <?php for ($i = 1; $i <= 10; $i++): ?>
                        <option value="<?= $i; ?>" <?= $i == $selectedGrade ? 'selected' : ''; ?>>Grade <?= $i; ?></option>
                    <?php endfor; ?>
                </select>
            </div>
            <div class="flex gap-2">
                <button id="pdfExport" class="bg-red-600 text-white px-4 py-2 rounded hover:bg-red-700"><i class="fas fa-file-pdf mr-1"></i> Export PDF</button>
                <button onclick="window.print()" class="bg-gray-600 text-white px-4 py-2 rounded hover:bg-gray-700"><i class="fas fa-print mr-1"></i> Print</button>
            </div>
        </section>

        <section class="max-w-screen-xl mx-auto px-6 pb-12">
            <div class="overflow-x-auto bg-white rounded-2xl shadow-md ring-1 ring-gray-200">
                <table id="studentsTable" class="w-full text-sm text-left text-gray-700">
                    <thead class="bg-gray-100 text-sky-700 uppercase text-xs">
                        <tr class="text-center">
                            <th class="px-4 py-3">Photo</th>
                            <th class="px-4 py-3">Full Name</th>
                            <th class="px-4 py-3">Grade</th>
                            <th class="px-4 py-3">Section</th>
                            <th class="px-4 py-3">Roll No</th>
                            <th class="px-4 py-3">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-100">
                        <?php foreach ($students as $student): ?>
                            <tr class="hover:bg-gray-50 text-center">
                                <td class="px-4 py-3">
                                    <?php if (!empty($student['profile_photo']) && file_exists($student['profile_photo'])): ?>
                                        <img src="<?= $student['profile_photo']; ?>" alt="Photo" class="h-10 w-10 rounded-full object-cover border border-gray-300 mx-auto">
                                    <?php else: ?>
                                        <div class="h-10 w-10 bg-gray-300 rounded-full flex items-center justify-center text-xs text-gray-600 mx-auto font-bold">N/A</div>
                                    <?php endif; ?>
                                </td>
                                <td class="px-4 py-3 text-sky-800 font-semibold">
                                    <!-- ✅ Fixed: Added grade to view link -->
                                    <a href="view_student.php?id=<?= $student['id']; ?>&grade=<?= urlencode($selectedGrade); ?>" class="hover:underline">
                                        <?= htmlspecialchars($student['full_name']); ?>
                                    </a>
                                </td>
                                <td class="px-4 py-3">
                                    <span class="px-3 py-1 bg-sky-100 text-sky-700 rounded-full text-xs font-semibold">Grade <?= $student['grade']; ?></span>
                                </td>
                                <td class="px-4 py-3">
                                    <span class="px-3 py-1 bg-emerald-100 text-emerald-700 rounded-full text-xs font-semibold"><?= $student['section']; ?></span>
                                </td>
                                <td class="px-4 py-3"><?= $student['roll_number']; ?></td>
                                <td class="px-4 py-3 space-x-3">
                                    <!-- ✅ Fixed: Added grade to edit link -->
                                    <a href="edit_student.php?id=<?= $student['id']; ?>&grade=<?= urlencode($selectedGrade); ?>" class="text-yellow-500 hover:text-yellow-600 font-semibold">Edit</a>
                                    <a href="delete_student.php?id=<?= $student['id']; ?>" class="text-red-500 hover:text-red-600 font-semibold" onclick="return confirm('Are you sure you want to delete this student?')">Delete</a>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
                <?php if (empty($students)): ?>
                    <div class="p-6 text-center text-gray-500 font-medium">No students found.</div>
                <?php endif; ?>
            </div>
        </section>
    </main>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.29/jspdf.plugin.autotable.min.js"></script>

<script>
    $(document).ready(function () {
        $('#studentsTable').DataTable();

        document.getElementById('pdfExport').addEventListener('click', function () {
            const { jsPDF } = window.jspdf;
            const doc = new jsPDF();
            doc.text("Student List", 14, 15);
            const table = document.getElementById("studentsTable");
            const headers = Array.from(table.querySelectorAll("thead th")).map(th => th.innerText);
            const rows = Array.from(table.querySelectorAll("tbody tr")).map(tr =>
                Array.from(tr.querySelectorAll("td")).map(td => td.innerText.trim())
            );
            doc.autoTable({ head: [headers], body: rows, startY: 25 });
            doc.save("students.pdf");
        });

        const gradeSelect = document.getElementById("gradeSelect");
        gradeSelect.addEventListener("change", () => {
            const selectedGrade = gradeSelect.value;
            const urlParams = new URLSearchParams(window.location.search);
            selectedGrade ? urlParams.set('grade', selectedGrade) : urlParams.delete('grade');
            window.location.search = urlParams.toString();
        });
    });
</script>
</body>
</html>
