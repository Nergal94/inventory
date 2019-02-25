<?php 
    session_start();


    $servername = '127.0.0.1';
    $username = 'username';
    $password = 'password';
    $dbname = 'Users';

    $conn = new mysqli($servername, $username, $password, $dbname);

    $username = '';
    if (isset($_SESSION["user"])) $username = $_SESSION["user"];
    if (isset($_POST['user'])) $username = $_POST['user'];
    
    $password = '';
    if (isset($_SESSION["pass"])) $password = $_SESSION["pass"];
    if (isset($_POST['pass'])) $password = $_POST['pass'];

    $error = 0;
    if (isset($_GET['error'])) $error = $_GET['error'];

    $gotoparam = 'index.php';

    $sqlSearchUser = "SELECT * FROM `Users` WHERE User LIKE '$username'";

    $result = $conn->query($sqlSearchUser);
    $row = $result->fetch_assoc();
        
    if ($username == $row["User"] && $password == $row["Password"] && $username != '' && $password != '') {
        $_SESSION["user"] = "$username";
        $_SESSION["pass"] = "$password";
        header("Location: /inventory.php?database=LastUpdate");
    } elseif ($username != '' && $password != '') {
        $gotoparam = '/index.php?error=1';
    };

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Sign In</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no user-scalable=no">
    <link rel="stylesheet" href="css/index.css">
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
</head>

<body>
    <div class="container">
        <header><img src="img/logo.png" alt=""></header>
        <div class="main">
                <form action="<?php echo $gotoparam ?>" method="post">
                    <img src="img/icons-login.png" alt="">
                    <?php 
                        if ($error == 1) echo '<div class="error">Invalid username or password</div>';
                    ?>
                    <input type="text" name="user" class="user" placeholder="Username">
                    <input type="password" name="pass" class="pass" placeholder="Password">
                    <button class="submitform">Sign In</button>
                </form>
        </div>
    </div>
</body>

</html>
