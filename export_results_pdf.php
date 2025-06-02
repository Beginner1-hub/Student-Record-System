<?php
require('fpdf.php');
include 'connect.php';

$selectedGrade = $_GET['grade'] ?? '';

$query = "
  SELECT students.*, r.marks_obtained, r.max_marks, r.grade AS result_grade, r.remarks, r.exam_type
  FROM students
  LEFT JOIN result r ON students.id = r.student_id
  WHERE students.is_deleted = 0";

$params = [];
if ($selectedGrade) {
    $query .= " AND students.grade = ?";
    $params[] = $selectedGrade;
}
$query .= " ORDER BY students.grade, students.full_name";
$stmt = $pdo->prepare($query);
$stmt->execute($params);
$students = $stmt->fetchAll();

class PDF extends FPDF {
    function Header() {
        $this->SetFont('Arial', 'B', 16);
        $this->SetTextColor(40, 40, 120);
        $this->Cell(0, 10, 'Student Result Report', 0, 1, 'C');
        $this->Ln(5);
    }

    function Footer() {
        $this->SetY(-15);
        $this->SetFont('Arial','I',8);
        $this->SetTextColor(150);
        $this->Cell(0,10,'Page '.$this->PageNo().'/{nb}',0,0,'C');
    }
}

$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->AddPage('L');
$pdf->SetFont('Arial','B',10);
$pdf->SetFillColor(220, 220, 255);

// Table header
$headers = ['#', 'Name', 'Grade', 'Section', 'Roll', 'Marks', 'Max', 'Grade', 'Remarks', 'Exam'];
$widths = [10, 50, 15, 20, 20, 20, 20, 20, 50, 30];
foreach ($headers as $i => $header) {
    $pdf->Cell($widths[$i], 10, $header, 1, 0, 'C', true);
}
$pdf->Ln();

// Table body
$pdf->SetFont('Arial','',9);
$i = 1;
foreach ($students as $s) {
    $pdf->Cell($widths[0], 8, $i++, 1);
    $pdf->Cell($widths[1], 8, $s['full_name'], 1);
    $pdf->Cell($widths[2], 8, $s['grade'], 1);
    $pdf->Cell($widths[3], 8, $s['section'], 1);
    $pdf->Cell($widths[4], 8, $s['roll_number'], 1);
    $pdf->Cell($widths[5], 8, $s['marks_obtained'], 1);
    $pdf->Cell($widths[6], 8, '700', 1);
    $pdf->Cell($widths[7], 8, $s['result_grade'], 1);
    $pdf->Cell($widths[8], 8, $s['remarks'], 1);
    $pdf->Cell($widths[9], 8, ucfirst($s['exam_type']), 1);
    $pdf->Ln();
}

$pdf->Output('I', 'student_results.pdf');
