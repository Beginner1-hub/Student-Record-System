<?php
include 'connect.php';
session_start();

function logActivity($pdo, $studentId, $action, $description, $admin_id) {
    $stmt = $pdo->prepare("INSERT INTO activity_log (student_id, action, description, admin_id, created_at) VALUES (?, ?, ?, ?, NOW())");
    $stmt->execute([$studentId, $action, $description, $admin_id]);
}

// FIXED: Capture grade context from POST (after submit) or GET (on initial load)
$gradeContext = $_POST['grade_context'] ?? ($_GET['grade'] ?? '');

if (!isset($_GET['id'])) {
    header("Location: view_students.php" . ($gradeContext ? "?grade=" . urlencode($gradeContext) : ""));
    exit;
}

$id = $_GET['id'];
$stmt = $pdo->prepare("SELECT * FROM students WHERE id = ?");
$stmt->execute([$id]);
$student = $stmt->fetch();

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
    $status = $_POST['status'];
    $delete_photo = isset($_POST['delete_photo']);

    $image_path = $student['profile_photo'];
    if ($delete_photo && file_exists($image_path)) {
        unlink($image_path);
        $image_path = '';
    }

    if (isset($_FILES['profile_photo']) && $_FILES['profile_photo']['error'] === 0) {
        $image_name = time() . '_' . basename($_FILES['profile_photo']['name']);
        $image_tmp = $_FILES['profile_photo']['tmp_name'];
        $image_path = 'uploads/' . $image_name;
        move_uploaded_file($image_tmp, $image_path);
    }

    $update = $pdo->prepare("UPDATE students SET full_name=?, age=?, dob=?, gender=?, grade=?, section=?, roll_number=?, address=?, guardian_name=?, guardian_contact=?, emergency_contact=?, enrollment_date=?, status=?, profile_photo=? WHERE id=?");
    $update->execute([$full_name, $age, $dob, $gender, $grade, $section, $roll_number, $address, $guardian_name, $guardian_contact, $emergency_contact, $enrollment_date, $status, $image_path, $id]);

    logActivity($pdo, $id, "Student Updated", "Student information updated", $_SESSION['admin_id']);

    echo "<script>
        alert('Student details updated successfully!');
        window.location.href = 'view_students.php" . ($gradeContext ? "?grade=" . urlencode($gradeContext) : "") . "';
    </script>";
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Student</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 font-sans">
<div class="flex">
    <aside class="w-64 bg-blue-900 text-white p-5 min-h-screen shadow-xl">
        <div class="text-center mb-10">
            <h1 class="text-3xl font-extrabold">Student<span class="text-yellow-300">Admin</span></h1>
        </div>
        <nav>
            <ul class="space-y-3 text-base font-medium">
                <li><a href="admin_dashboard.php" class="flex items-center gap-3 px-4 py-3 hover:bg-white/10 rounded"><i class="fas fa-home"></i>Dashboard</a></li>
                <li><a href="view_students.php<?= $gradeContext ? '?grade=' . urlencode($gradeContext) : '' ?>" class="flex items-center gap-3 px-4 py-3 hover:bg-white/10 rounded"><i class="fas fa-users"></i>View Students</a></li>
                <li><a href="logout.php" class="flex items-center gap-3 px-4 py-3 text-red-400 hover:text-red-200"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
            </ul>
        </nav>
    </aside>

    <main class="flex-1 p-8">
        <div class="bg-white p-8 rounded-xl shadow-lg max-w-5xl mx-auto">
            <div class="flex items-center justify-between mb-6">
                <h2 class="text-3xl font-semibold text-blue-800">Edit Student</h2>
                <a href="view_students.php<?= $gradeContext ? '?grade=' . urlencode($gradeContext) : '' ?>" class="text-sm font-medium text-blue-600 hover:text-blue-800"><i class="fas fa-arrow-left mr-1"></i> Back to Students List</a>
            </div>

            <form method="post" enctype="multipart/form-data">
                <!-- FIXED: Hidden grade context input -->
                <input type="hidden" name="grade_context" value="<?= htmlspecialchars($gradeContext); ?>">

                <div class="grid grid-cols-1 md:grid-cols-2 gap-6 text-gray-800 text-[15px]">
                    <div><label class="block mb-1 font-semibold">Full Name</label><input name="full_name" value="<?= htmlspecialchars($student['full_name']); ?>" required class="w-full px-4 py-2 border rounded-lg"></div>
                    <div><label class="block mb-1 font-semibold">Age</label><input name="age" value="<?= $student['age']; ?>" required class="w-full px-4 py-2 border rounded-lg"></div>
                    <div><label class="block mb-1 font-semibold">Date of Birth</label><input type="date" name="dob" value="<?= $student['dob']; ?>" required class="w-full px-4 py-2 border rounded-lg"></div>
                    <div><label class="block mb-1 font-semibold">Gender</label><select name="gender" class="w-full px-4 py-2 border rounded-lg" required><option value="Male" <?= $student['gender'] === 'Male' ? 'selected' : ''; ?>>Male</option><option value="Female" <?= $student['gender'] === 'Female' ? 'selected' : ''; ?>>Female</option><option value="Other" <?= $student['gender'] === 'Other' ? 'selected' : ''; ?>>Other</option></select></div>
                    <div><label class="block mb-1 font-semibold">Grade</label><input name="grade" value="<?= $student['grade']; ?>" required class="w-full px-4 py-2 border rounded-lg"></div>
                    <div><label class="block mb-1 font-semibold">Section</label><input name="section" value="<?= $student['section']; ?>" required class="w-full px-4 py-2 border rounded-lg"></div>
                    <div><label class="block mb-1 font-semibold">Roll Number</label><input name="roll_number" value="<?= $student['roll_number']; ?>" required class="w-full px-4 py-2 border rounded-lg"></div>
                    <div><label class="block mb-1 font-semibold">Address</label><input name="address" value="<?= htmlspecialchars($student['address']); ?>" required class="w-full px-4 py-2 border rounded-lg"></div>
                    <div><label class="block mb-1 font-semibold">Guardian Name</label><input name="guardian_name" value="<?= htmlspecialchars($student['guardian_name']); ?>" required class="w-full px-4 py-2 border rounded-lg"></div>
                    <div><label class="block mb-1 font-semibold">Guardian Contact</label><input name="guardian_contact" value="<?= $student['guardian_contact']; ?>" required class="w-full px-4 py-2 border rounded-lg"></div>
                    <div><label class="block mb-1 font-semibold">Emergency Contact</label><input name="emergency_contact" value="<?= $student['emergency_contact']; ?>" required class="w-full px-4 py-2 border rounded-lg"></div>
                    <div><label class="block mb-1 font-semibold">Enrollment Date</label><input type="date" name="enrollment_date" value="<?= $student['enrollment_date']; ?>" required class="w-full px-4 py-2 border rounded-lg"></div>
                    <div><label class="block mb-1 font-semibold">Status</label><select name="status" class="w-full px-4 py-2 border rounded-lg"><option value="active" <?= $student['status'] === 'active' ? 'selected' : ''; ?>>Active</option><option value="inactive" <?= $student['status'] === 'inactive' ? 'selected' : ''; ?>>Inactive</option></select></div>
                    <div class="col-span-full">
                        <label class="block mb-1 font-semibold">Profile Picture</label>
                        <input type="file" name="profile_photo" class="w-full px-4 py-2 border rounded-lg">
                        <?php if (!empty($student['profile_photo'])): ?>
                            <div class="mt-4 flex items-center gap-4">
                                <img src="<?= $student['profile_photo']; ?>" alt="Profile" class="w-24 h-24 object-cover rounded-full border">
                                <label class="inline-flex items-center space-x-2">
                                    <input type="checkbox" name="delete_photo" class="form-checkbox">
                                    <span class="text-sm text-red-600">Delete Photo</span>
                                </label>
                            </div>
                        <?php endif; ?>
                    </div>
                </div>
                <button type="submit" class="w-full bg-blue-600 text-white py-3 mt-6 rounded-lg hover:bg-blue-700 font-semibold text-[15px]">Update Student</button>
            </form>
        </div>
    </main>
</div>
</body>
</html>
