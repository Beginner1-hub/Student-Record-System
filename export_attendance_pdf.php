<?php
require 'connect.php';
require_once 'vendor/autoload.php'; // mPDF

$grade = $_GET['grade'] ?? '';
$month = $_GET['month'] ?? date('Y-m');

if (!$grade) {
    die('Grade is required');
}

$monthLabel = date('F Y', strtotime($month));

$stmt = $pdo->prepare("SELECT s.full_name, s.roll_number,
      SUM(a.status = 'Present') AS present_days,
      SUM(a.status = 'Absent') AS absent_days,
      SUM(a.status = 'Late') AS late_days,
      COUNT(a.id) AS total_days
    FROM students s
    LEFT JOIN attendance a ON s.id = a.student_id AND DATE_FORMAT(a.attendance_date, '%Y-%m') = ?
    WHERE s.grade = ? AND s.is_deleted = 0
    GROUP BY s.id
    ORDER BY s.full_name");
$stmt->execute([$month, $grade]);
$students = $stmt->fetchAll();

use Mpdf\Mpdf;
$mpdf = new Mpdf();
$html = "<h2 style='text-align:center;'>Attendance Summary - Grade $grade ($monthLabel)</h2>";
$html .= "<table border='1' cellspacing='0' cellpadding='5' width='100%'>
<tr>
<th>#</th>
<th>Name</th>
<th>Roll</th>
<th>Present</th>
<th>Absent</th>
<th>Late</th>
<th>Total</th>
<th>% Attendance</th>
</tr>";

foreach ($students as $i => $s) {
    $percent = $s['total_days'] > 0 ? round(($s['present_days'] / $s['total_days']) * 100, 2) : 0;
    $html .= "<tr>
    <td>".($i+1)."</td>
    <td>".htmlspecialchars($s['full_name'])."</td>
    <td>".htmlspecialchars($s['roll_number'])."</td>
    <td style='color:green;'>".$s['present_days']."</td>
    <td style='color:red;'>".$s['absent_days']."</td>
    <td style='color:orange;'>".$s['late_days']."</td>
    <td>".$s['total_days']."</td>
    <td><strong>".$percent."%</strong></td>
    </tr>";
}

$html .= "</table>";
$mpdf->WriteHTML($html);
$mpdf->Output("attendance_summary_grade{$grade}_$month.pdf", 'D');
exit;
