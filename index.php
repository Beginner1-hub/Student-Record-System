<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Student Record Management System</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    html, body {
      margin: 0;
      padding: 0;
      height: 100%;
      font-family: 'Georgia', serif;
    }

    .bg-section {
      background: url('5.jpg') no-repeat center center/cover;
      height: 100vh;
      position: relative;
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
      text-align: center;
    }

    .overlay {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.25);
      z-index: 1;
    }

    .hero-content {
      position: relative;
      z-index: 2;
      background: rgba(0, 0, 0, 0.45);
      padding: 60px 50px;
      border-radius: 20px;
      max-width: 900px;
      width: 95%;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.4);
      backdrop-filter: blur(10px);
    }

    .hero-content h1 {
      font-size: 2.8rem;
      font-weight: bold;
      margin-bottom: 20px;
      color: #fff;
      line-height: 1.3;
      text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.6);
    }

    .hero-content p {
      font-size: 1.1rem;
      color: #e0e0e0;
      margin-bottom: 30px;
      line-height: 1.6;
    }

    .btn-login {
      background-color: #ffffff;
      color: #000000;
      font-weight: 600;
      padding: 12px 34px;
      border-radius: 30px;
      font-size: 1rem;
      border: none;
      transition: 0.3s ease-in-out;
      box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
      text-decoration: none;
    }

    .btn-login:hover {
      background-color: #f1f1f1;
      color: #000;
    }

    @media (max-width: 768px) {
      .hero-content {
        padding: 40px 20px;
      }

      .hero-content h1 {
        font-size: 2rem;
      }

      .hero-content p {
        font-size: 1rem;
      }
    }
  </style>
</head>
<body>

<section class="bg-section">
  <div class="overlay"></div>
  <div class="hero-content">
    <h1>Student Record Management System</h1>
    <p>We’re committed to academic excellence and innovation in record keeping.</p>
    <a href="login.php" class="btn btn-login">Admin Login</a>
  </div>
</section>

</body>
</html>
