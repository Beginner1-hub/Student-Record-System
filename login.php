<?php
session_start();
require 'connect.php';

$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username'] ?? '');
    $password = trim($_POST['password'] ?? '');

    // Fetch admin data by username
    $stmt = $pdo->prepare("SELECT * FROM admin WHERE username = ?");
    $stmt->execute([$username]);
    $admin = $stmt->fetch();

    // Verify password
    if ($admin && password_verify($password, $admin['password'])) {
        // Store admin details in session
        $_SESSION['admin_id'] = $admin['id'];
        $_SESSION['admin_username'] = $admin['username'];
        $_SESSION['admin_role'] = $admin['role'] ?? 'full'; // Set role

        header("Location: admin_dashboard.php");
        exit;
    } else {
        $error = "Invalid username or password.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login - Student Records</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
        }

        .split {
            display: flex;
            height: 100vh;
        }

        .left {
            background-color: #003049;
            color: white;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 40px;
        }

        .icon-box {
            font-size: 80px;
            margin-bottom: 20px;
        }

        .right {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f6f8fa;
        }

        .form-box {
            width: 100%;
            max-width: 400px;
            padding: 30px;
            background: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        h2 {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="split">
    <div class="left position-relative">
        <a href="index.php" class="btn btn-light position-absolute top-0 start-0 m-3">
            &larr; Back to Home
        </a>
        <div class="icon-box">
            <i class="fas fa-graduation-cap"></i>
        </div>
        <div class="text-center">
            <h1>Student Record System</h1>
            <p>
                Welcome to the Admin Panel.<br>
                Manage student information, academic performance,<br>
                attendance, and system users securely and efficiently.
            </p>
        </div>
    </div>

    <div class="right">
        <div class="form-box">
            <h2>Admin Login</h2>
            <?php if ($error): ?>
                <div class="alert alert-danger"><?= htmlspecialchars($error) ?></div>
            <?php endif; ?>
            <form method="POST">
                <div class="mb-3">
                    <label>Username</label>
                    <input type="text" name="username" class="form-control" placeholder="Enter your username" required>
                </div>
                <div class="mb-3">
                    <label>Password</label>
                    <input type="password" name="password" class="form-control" placeholder="Enter your password" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Log In</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>

