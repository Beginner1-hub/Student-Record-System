<?php
use PHPUnit\Framework\TestCase;

require_once __DIR__ . '/../connect.php';

class StudentTest extends TestCase
{
    private $conn;

    protected function setUp(): void
    {
        $this->conn = new mysqli('localhost', 'root', '', 'student_management');
    }

    public function testAddStudent()
    {
        $sql = "INSERT INTO students (full_name, profile_photo, age, dob, gender, grade, section, roll_number, address, guardian_name, guardian_contact, emergency_contact, enrollment_date, status, is_deleted, created_at, updated_at)
                VALUES ('Unit Tester', 'uploads/test.jpg', 15, '2010-05-15', 'Male', '10', 'A', 999, 'Testville', 'Test Guardian', '9800000000', '9811111111', CURDATE(), 'Active', 0, NOW(), NOW())";
        $result = $this->conn->query($sql);
        $this->assertTrue($result, 'Failed to add student');
    }

    public function testEditStudent()
    {
        $sql = "UPDATE students SET full_name='Edited Tester', updated_at=NOW() WHERE roll_number=999";
        $result = $this->conn->query($sql);
        $this->assertTrue($result, 'Failed to edit student');
    }

    public function testDeleteStudent()
    {
        $sql = "DELETE FROM students WHERE roll_number=999";
        $result = $this->conn->query($sql);
        $this->assertTrue($result, 'Failed to delete student');
    }

    public function testListStudents()
    {
        $result = $this->conn->query("SELECT * FROM students");
        $this->assertIsObject($result);
        $this->assertGreaterThan(0, $result->num_rows, "No students found");
    }

    public function testFindStudentById()
    {
        $id = 168;
        $result = $this->conn->query("SELECT * FROM students WHERE id = $id");
        $this->assertIsObject($result);
        $this->assertEquals(1, $result->num_rows, "Student not found");
    }

    public function testValidateEmailFormat()
    {
        $email = "test@example.com";
        $this->assertMatchesRegularExpression("/^.+@.+\..+$/", $email, "Invalid email format");
    }

    public function testFilterStudentsByGrade()
    {
        $result = $this->conn->query("SELECT DISTINCT grade FROM students");
        $this->assertIsObject($result);
        $this->assertGreaterThan(0, $result->num_rows, "No grades found");
    }
}
?>
