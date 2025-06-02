<?php
include 'connect.php';
function logActivity($pdo, $studentId, $action, $description) {
    $stmt = $pdo->prepare("INSERT INTO activity_log (student_id, action, description, created_at) VALUES (?, ?, ?, NOW())");
    $stmt->execute([$studentId, $action, $description]);
}

if (!isset($_GET['fee_id'])) {
    die('Fee ID missing');
}

$fee_id = $_GET['fee_id'];
$stmt = $pdo->prepare("
    SELECT fees.*, students.full_name, students.enrollment_date, students.roll_number, students.grade, students.section 
    FROM fees 
    JOIN students ON fees.student_id = students.id 
    WHERE fees.id = ?
");
$stmt->execute([$fee_id]);
$fee = $stmt->fetch();

if (!$fee) {
    die('Fee record not found');
}

$due_date = ($fee['status'] === 'unpaid') ? date('d M Y', strtotime('+30 days')) : null;
$month_paid = $fee['month'];
$back_url = $_SERVER['HTTP_REFERER'] ?? 'view_student_fees.php';
$cleaned_name = preg_replace('/[^a-zA-Z0-9]/', '_', $fee['full_name']);
$remarks = ($fee['status'] === 'paid') ? "Payment completed. No dues pending." : "Please clear the due by the due date.";
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Fee Receipt</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <style>
    @media print {
      .no-print {
        display: none !important;
      }
    }
    .watermark {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      font-size: 5rem;
      color: rgba(0, 0, 0, 0.05);
      pointer-events: none;
      z-index: 0;
      user-select: none;
      white-space: nowrap;
    }
  </style>
</head>
<body class="bg-gray-100 font-sans p-6 relative">
  <div class="watermark">ASSR Public School</div>

  <div id="receipt" class="max-w-2xl mx-auto bg-white p-8 border border-gray-300 rounded-xl shadow-lg relative z-10">
    <!-- Header -->
    <div class="text-center border-b pb-4 mb-6">
      <h1 class="text-2xl font-bold text-blue-800">ASSR Public School</h1>
      <p class="text-gray-600">Official Fee Receipt</p>
      <p class="text-sm text-gray-500 font-mono tracking-wide">Issued on: <?= date('d M Y'); ?></p>
    </div>

    <!-- Student Info -->
    <div class="mb-6">
      <h2 class="text-lg font-semibold text-gray-800 mb-2">Student Information</h2>
      <table class="w-full text-sm text-gray-700">
        <tr><td class="py-1 font-medium">Name:</td><td><?= htmlspecialchars($fee['full_name']); ?></td></tr>
        <tr><td class="py-1 font-medium">Roll Number:</td><td><?= htmlspecialchars($fee['roll_number']); ?></td></tr>
        <tr><td class="py-1 font-medium">Grade:</td><td><?= htmlspecialchars($fee['grade']); ?></td></tr>
        <tr><td class="py-1 font-medium">Section:</td><td><?= htmlspecialchars($fee['section']); ?></td></tr>
        <tr><td class="py-1 font-medium">Enrollment Date:</td><td><?= date('d M Y', strtotime($fee['enrollment_date'])); ?></td></tr>
        <tr><td class="py-1 font-medium">Month Paid:</td><td><?= $month_paid; ?></td></tr>
      </table>
    </div>

    <!-- Payment Details -->
    <div class="mb-6">
      <h2 class="text-lg font-semibold text-gray-800 mb-2">Payment Details</h2>
      <table class="w-full text-sm text-gray-700">
        <tr><td class="py-1 font-medium">Total Fee:</td><td>₹<?= number_format($fee['total_fee'], 2); ?></td></tr>
        <tr><td class="py-1 font-medium">Amount Paid:</td><td>₹<?= number_format($fee['amount_paid'], 2); ?></td></tr>
        <tr><td class="py-1 font-medium">Status:</td><td><?= ucfirst($fee['status']); ?></td></tr>
        <?php if ($due_date): ?>
        <tr><td class="py-1 font-medium">Due Date:</td><td><?= $due_date; ?></td></tr>
        <?php endif; ?>
        <tr><td class="py-1 font-medium">Remarks:</td><td><?= $remarks ?></td></tr>
      </table>
    </div>

    <!-- Footer Note -->
    <div class="text-gray-500 text-sm italic border-t pt-4 mb-2">
      Thank you for your payment. Please retain this receipt for future reference.
    </div>
    <div class="text-xs text-gray-400 mt-1">
      Contact us: +91-1234567890 | info@assr.edu.in | www.assrpublicschool.edu.in
    </div>

    <!-- Action Buttons -->
    <div class="no-print mt-6 flex justify-between">
      <a href="<?= htmlspecialchars($back_url); ?>" class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">← Back</a>
      <div class="space-x-2">
        <button onclick="printReceipt()" class="bg-gray-700 text-white px-4 py-2 rounded hover:bg-gray-800">🖨 Print</button>
        <button id="exportBtn" class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700">⬇ Export PDF</button>
      </div>
    </div>
  </div>

  <!-- jsPDF + Script -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
  <script>
    function printReceipt() {
      window.print();
    }

    window.addEventListener("DOMContentLoaded", () => {
      const exportBtn = document.getElementById("exportBtn");
      exportBtn.addEventListener("click", async () => {
        const { jsPDF } = window.jspdf;
        const doc = new jsPDF('p', 'pt', 'a4');

        const receipt = document.getElementById("receipt");
        await html2canvas(receipt).then(canvas => {
          const imgData = canvas.toDataURL("image/png");
          const imgProps = doc.getImageProperties(imgData);
          const pdfWidth = doc.internal.pageSize.getWidth();
          const pdfHeight = (imgProps.height * pdfWidth) / imgProps.width;
          doc.addImage(imgData, "PNG", 20, 20, pdfWidth - 40, pdfHeight);
          doc.save("Fee_Receipt_<?= $cleaned_name ?>_<?= $month_paid ?>.pdf");
        });
      });
    });
  </script>
</body>
</html>
