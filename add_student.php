<?php
include 'connect.php';
session_start();

if (!isset($_SESSION['admin_id'])) {
    header("Location: login.php");
    exit;
}

$adminUsername = htmlspecialchars($_SESSION['admin_username'] ?? 'Admin');

function logActivity($pdo, $studentId, $action, $description) {
    $stmt = $pdo->prepare("INSERT INTO activity_log (student_id, action, description, created_at) VALUES (?, ?, ?, NOW())");
    $stmt->execute([$studentId, $action, $description]);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $full_name = $_POST['full_name'];
    $age = $_POST['age'];
    $dob = $_POST['dob'];
    $gender = $_POST['gender'];
    $grade = $_POST['grade'];
    $section = $_POST['section'];
    $roll_number = $_POST['roll_number'];
    $address = $_POST['address'];
    $guardian_name = $_POST['guardian_name'];
    $guardian_contact = $_POST['guardian_contact'];
    $emergency_contact = $_POST['emergency_contact'];
    $enrollment_date = $_POST['enrollment_date'];

    $photoPath = '';

    if (isset($_FILES['profile_photo']) && $_FILES['profile_photo']['error'] === UPLOAD_ERR_OK) {
        $uploadDir = 'uploads/';
        if (!is_dir($uploadDir)) {
            mkdir($uploadDir, 0755, true);
        }

        $photoName = time() . '_' . basename($_FILES['profile_photo']['name']);
        $targetFile = $uploadDir . $photoName;

        if (move_uploaded_file($_FILES['profile_photo']['tmp_name'], $targetFile)) {
            $photoPath = $targetFile;
        }
    }

    if (empty($roll_number)) {
        $roll_number = strtoupper($grade . $section . rand(100, 999));
    }

    $check = $pdo->prepare("SELECT COUNT(*) FROM students WHERE roll_number = ?");
    $check->execute([$roll_number]);

    if ($check->fetchColumn() > 0) {
        $errorMsg = "Roll number <strong>$roll_number</strong> already exists. Please try again.";
    } else {
        $stmt = $pdo->prepare("INSERT INTO students (full_name, age, dob, gender, grade, section, roll_number, address, guardian_name, guardian_contact, emergency_contact, enrollment_date, profile_photo) 
            VALUES (:full_name, :age, :dob, :gender, :grade, :section, :roll_number, :address, :guardian_name, :guardian_contact, :emergency_contact, :enrollment_date, :profile_photo)");

        $stmt->bindParam(':full_name', $full_name);
        $stmt->bindParam(':age', $age);
        $stmt->bindParam(':dob', $dob);
        $stmt->bindParam(':gender', $gender);
        $stmt->bindParam(':grade', $grade);
        $stmt->bindParam(':section', $section);
        $stmt->bindParam(':roll_number', $roll_number);
        $stmt->bindParam(':address', $address);
        $stmt->bindParam(':guardian_name', $guardian_name);
        $stmt->bindParam(':guardian_contact', $guardian_contact);
        $stmt->bindParam(':emergency_contact', $emergency_contact);
        $stmt->bindParam(':enrollment_date', $enrollment_date);
        $stmt->bindParam(':profile_photo', $photoPath);

        if ($stmt->execute()) {
            echo "<script>
                setTimeout(function(){
                    window.location.href = 'admin_dashboard.php';
                }, 3000);
            </script>";
            $successMsg = "Student added successfully!";
        } else {
            $errorMsg = "Error adding student.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Add Student</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 font-sans">
<div class="flex">
  <!-- Sidebar -->
  <aside class="w-64 bg-blue-900 text-white p-5 min-h-screen shadow-xl">
    <div class="text-center mb-10">
      <h1 class="text-3xl font-extrabold">Student<span class="text-yellow-300">Admin</span></h1>
    </div>
    <nav>
      <ul class="space-y-3 text-base font-medium">
        <li><a href="admin_dashboard.php" class="flex items-center gap-3 px-4 py-3 hover:bg-white/10 rounded"><i class="fas fa-home"></i><span>Dashboard</span></a></li>
        <li><a href="add_student.php" class="flex items-center gap-3 px-4 py-3 bg-gradient-to-r from-blue-700 to-indigo-800 font-semibold shadow rounded-lg"><i class="fas fa-user-plus"></i><span>Add Student</span></a></li>
        <li><a href="view_students.php" class="flex items-center gap-3 px-4 py-3 hover:bg-white/10 rounded"><i class="fas fa-users"></i><span>View All Students</span></a></li>
        <li><a href="logout.php" class="flex items-center gap-3 px-4 py-3 text-red-400 hover:text-red-200"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a></li>
      </ul>
    </nav>
  </aside>

  <!-- Main Content -->
  <main class="flex-1 p-8">
    <!-- Header -->
    <header class="flex justify-between items-center bg-white shadow p-4 rounded-md mb-6">
      <h2 class="text-2xl font-bold text-gray-800">Welcome, <?= $adminUsername ?></h2>
      <div class="relative">
        <button onclick="toggleDropdown()" class="flex items-center gap-2 px-4 py-2 bg-blue-600 text-white rounded-full shadow">
          <i class="fas fa-user-circle text-lg"></i>
          <?= $adminUsername ?>
          <i class="fas fa-caret-down text-sm"></i>
        </button>
        <div id="dropdownMenu" class="hidden absolute right-0 mt-2 w-48 bg-white border rounded shadow-lg z-10">
          <a href="#" class="block px-4 py-2 hover:bg-gray-100">Profile</a>
          <a href="logout.php" class="block px-4 py-2 hover:bg-red-100 text-red-600">Logout</a>
        </div>
      </div>
    </header>

    <script>
      function toggleDropdown() {
        document.getElementById("dropdownMenu").classList.toggle("hidden");
      }
    </script>

    <!-- Form -->
    <div class="bg-white shadow-xl rounded-xl p-8 max-w-5xl mx-auto">
      <h2 class="text-3xl font-bold text-center text-blue-700 mb-6">Add New Student</h2>

      <?php if (isset($successMsg)): ?>
        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-4">
          <?= $successMsg ?>
        </div>
      <?php elseif (isset($errorMsg)): ?>
        <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4">
          <?= $errorMsg ?>
        </div>
      <?php endif; ?>

      <form action="add_student.php" method="POST" enctype="multipart/form-data" class="space-y-4">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
          <div>
            <label class="block font-semibold text-gray-700">Full Name</label>
            <input type="text" name="full_name" required class="w-full mt-1 p-3 border border-blue-300 rounded-lg shadow-sm" />
          </div>
          <div>
            <label class="block font-semibold text-gray-700">Age</label>
            <input type="number" name="age" required class="w-full mt-1 p-3 border border-purple-300 rounded-lg shadow-sm" />
          </div>
          <div>
            <label class="block font-semibold text-gray-700">Date of Birth</label>
            <input type="date" name="dob" required class="w-full mt-1 p-3 border border-green-300 rounded-lg shadow-sm" />
          </div>
          <div>
            <label class="block font-semibold text-gray-700">Gender</label>
            <select name="gender" required class="w-full mt-1 p-3 border border-yellow-300 rounded-lg shadow-sm">
              <option value="">Select Gender</option>
              <option value="Male">Male</option>
              <option value="Female">Female</option>
              <option value="Other">Other</option>
            </select>
          </div>
          <div>
            <label class="block font-semibold text-gray-700">Grade</label>
            <select name="grade" required class="w-full mt-1 p-3 border border-blue-300 rounded-lg shadow-sm">
              <option value="">Select Grade</option>
              <?php for ($i = 1; $i <= 10; $i++): ?>
                <option value="<?= $i ?>"><?= $i ?></option>
              <?php endfor; ?>
            </select>
          </div>
          <div>
            <label class="block font-semibold text-gray-700">Section</label>
            <select name="section" required class="w-full mt-1 p-3 border border-indigo-300 rounded-lg shadow-sm">
              <option value="">Select Section</option>
              <option value="A">A</option>
              <option value="B">B</option>
              <option value="C">C</option>
            </select>
          </div>
          <div>
            <label class="block font-semibold text-gray-700">Roll Number (optional)</label>
            <input type="text" name="roll_number" class="w-full mt-1 p-3 border border-gray-300 rounded-lg shadow-sm" placeholder="Leave blank for auto" />
          </div>
          <div>
            <label class="block font-semibold text-gray-700">Address</label>
            <input type="text" name="address" required class="w-full mt-1 p-3 border border-gray-300 rounded-lg shadow-sm" />
          </div>
          <div>
            <label class="block font-semibold text-gray-700">Guardian Name</label>
            <input type="text" name="guardian_name" required class="w-full mt-1 p-3 border border-pink-300 rounded-lg shadow-sm" />
          </div>
          <div>
            <label class="block font-semibold text-gray-700">Guardian Contact</label>
            <input type="text" name="guardian_contact" required class="w-full mt-1 p-3 border border-yellow-300 rounded-lg shadow-sm" />
          </div>
          <div>
            <label class="block font-semibold text-gray-700">Emergency Contact</label>
            <input type="text" name="emergency_contact" required class="w-full mt-1 p-3 border border-orange-300 rounded-lg shadow-sm" />
          </div>
          <div>
            <label class="block font-semibold text-gray-700">Enrollment Date</label>
            <input type="date" name="enrollment_date" required class="w-full mt-1 p-3 border border-green-300 rounded-lg shadow-sm" />
          </div>
          <div>
            <label class="block font-semibold text-gray-700">Profile Photo</label>
            <input type="file" name="profile_photo" accept="image/*" class="w-full mt-1 p-3 border border-gray-300 rounded-lg shadow-sm" />
          </div>
        </div>

        <div class="flex justify-between items-center mt-6">
          <a href="admin_dashboard.php" class="bg-gray-500 text-white px-4 py-2 rounded-lg hover:bg-gray-700">← Back</a>
          <button type="submit" class="bg-blue-600 hover:bg-blue-800 text-white px-6 py-2 rounded-lg font-semibold">Add Student</button>
        </div>
      </form>
    </div>
  </main>
</div>
</body>
</html>
