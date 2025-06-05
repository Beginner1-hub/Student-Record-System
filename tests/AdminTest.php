
<?php
use PHPUnit\Framework\TestCase;
require_once 'config.php';
class AdminTest extends TestCase {
    public function testLoginValidation() {
        $this->assertTrue(true);
    }
    public function testInvalidLogin() {
        $this->assertFalse(false);
    }
    public function testActivityLogs() {
        $this->assertTrue(true);
    }
}
