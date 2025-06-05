<?php

$conn = new mysqli("localhost", "root", "", "student_management");
if ($conn->connect_error) {
    die("Database connection failed.");
}


// Fetch Test
$result = $conn->query("SELECT * FROM students WHERE id = 101");
echo $result && $result->num_rows > 0 ? "Fetch Test: Passed<br>" : "Fetch Test: Failed<br>";

// Edit Test
$edit = $conn->query("UPDATE students SET name='Test' WHERE id = 101");
echo $edit ? "Edit Test: Passed<br>" : "Edit Test: Failed<br>";

// Delete Test
$delete = $conn->query("DELETE FROM students WHERE id = 105");
echo $delete ? "Delete Test: Passed<br>" : "Delete Test: Failed<br>";


$conn->close();
?>
