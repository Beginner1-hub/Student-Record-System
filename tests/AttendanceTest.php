<?php
use PHPUnit\Framework\TestCase;

require_once __DIR__ . '/../connect.php';

class AttendanceTest extends TestCase
{
    private $conn;

    protected function setUp(): void
    {
        $this->conn = new mysqli('localhost', 'root', '', 'student_management');
    }

    public function testMarkAttendance()
    {
        $sql = "INSERT INTO attendance (student_id, attendance_date, status) VALUES (168, CURDATE(), 'Present')";
        $result = $this->conn->query($sql);
        $this->assertTrue($result, "Failed to mark attendance");
    }

    public function testViewAttendanceSummary()
    {
        $result = $this->conn->query("SELECT student_id, COUNT(*) AS total_days FROM attendance GROUP BY student_id");
        $this->assertIsObject($result);
        $this->assertGreaterThan(0, $result->num_rows, "No summary data");
    }

    public function testDeleteAttendance()
    {
        $sql = "DELETE FROM attendance WHERE student_id=168 AND attendance_date=CURDATE()";
        $result = $this->conn->query($sql);
        $this->assertTrue($result, "Failed to delete attendance");
    }
}
?>
