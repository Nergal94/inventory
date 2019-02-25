<?php 
    session_start();

    $logout = 0;
    if (isset($_GET['logout'])) $logout = $_GET['logout'];

    if ($logout != 0) {
        session_unset();
        session_destroy();
    };

    $servername = '127.0.0.1';
    $username = 'username';
    $password = 'password';
    $dbnameInventory = 'inventory';
    $dbnameUsers = 'Users';

    $conn = new mysqli($servername, $username, $password, $dbnameInventory);
    $connFromUsers = new mysqli($servername, $username, $password, $dbnameUsers);

    $currentUser = '';

    if($_SESSION["user"] != '' && $_SESSION["pass"] != '') {
        $checkUser = $_SESSION["user"];
        $sql = "SELECT * FROM `Users` WHERE User LIKE '$checkUser'";
        $resultUser = $connFromUsers->query($sql);

        if ($resultUser) {
            $rowUser = $resultUser->fetch_assoc();
            if ($rowUser["User"] == $_SESSION["user"] && $rowUser["Password"] == $_SESSION["pass"]) $currentUser = $_SESSION["user"];
        };
    } else {
        header("Location: /index.php");
    }


    function sumAllId($conn) {
        $sqlAllIdComputer = "select id from Computer";
        $sqlAllIdVideo = "select id from Video";
        $sqlAllIdAudio = "select id from Audio";
        $sqlAllIdCommutation = "select id from Commutation";
        $sqlAllIdOthers = "select id from Others";

        $resultAllIdComputer = $conn->query($sqlAllIdComputer);
        $resultAllIdVideo = $conn->query($sqlAllIdVideo);
        $resultAllIdAudio = $conn->query($sqlAllIdAudio);
        $resultAllIdCommutation = $conn->query($sqlAllIdCommutation);
        $resultAllIdOthers = $conn->query($sqlAllIdOthers);

        $AllIdComputer = $resultAllIdComputer->num_rows;
        $AllIdVideo = $resultAllIdVideo->num_rows;
        $AllIdAudio = $resultAllIdAudio->num_rows;
        $AllIdCommutation = $resultAllIdCommutation->num_rows;
        $AllIdOthers = $resultAllIdOthers->num_rows;

        $allId = $AllIdComputer + $AllIdVideo + $AllIdAudio + $AllIdCommutation + $AllIdOthers;
        
        return $allId + 1;
    };

    $currentDataBase = 'LastUpdate';
    if (isset ($_GET['database'])) $currentDataBase = $_GET['database'];

    $gotoparam = 'inventory.php?database='.$currentDataBase;

    $id = '';
    if (isset ($_POST['id'])) $id = $_POST['id'];
    $name = '';
    if (isset ($_POST['name'])) $name = $_POST['name'];
    $quantity = '';
    if (isset ($_POST['quantity'])) $quantity = $_POST['quantity'];
    $price = '';
    if (isset ($_POST['price'])) $price = $_POST['price'];
    $stateValue = '';
    if (isset ($_POST['state'])) $stateValue = $_POST['state'];

    $state = 'В работе'; 
    if ($stateValue === '1') {
        $state = 'Необходим ремонт';
    } else if ($stateValue === '2') {
        $state = 'Ремонту не подлежит';
    }

    $comment = '';
    if (isset ($_POST['comment'])) $comment = $_POST['comment'];

    $currentDate = date("Y-m-d H:i:s");
    
    if($id < sumAllId($conn)) {
        $sqlAdd = "UPDATE $currentDataBase SET id=$id, name='$name', quantity=$quantity, price=$price, state='$state', comment='$comment' WHERE id=$id";
    } else {
        $sqlAdd = "INSERT INTO $currentDataBase (id, name, quantity, price, state, comment) VALUES($id, '$name', $quantity, $price, '$state', '$comment')";
    };

    $idAndCurrentDataBase = $id." ($currentDataBase)";
    $sqlLastUpdate = "INSERT INTO LastUpdate (date, id, name, changed, state, comment) VALUES('$currentDate' ,'$idAndCurrentDataBase', '$name', '$currentUser', '$state', '$comment')";
    $sqlLastUpdateSort = "ALTER TABLE `LastUpdate` ORDER BY `date` DESC";

    if($name != '' && $currentDataBase != 'LastUpdate') {
        $conn->query($sqlAdd);
        $conn->query($sqlLastUpdate);
        $conn->query($sqlLastUpdateSort);
    };

    $sqlShowTable = "SELECT * FROM $currentDataBase";
    $result = $conn->query($sqlShowTable);
    
    $currentID = sumAllId($conn);
    
    $conn->close();
    $connFromUsers->close();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>MostVideo.TV</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no user-scalable=no">
    <link rel="stylesheet" href="css/inventory.css">
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
</head>


<body>
    <div class="container">
        <header>
        <img src="img/logo.png" alt="">
        <div class="current-user">
            <?php 
                echo "<span>$currentUser</span>";
            ?> 
            <a href="inventory.php?database=LastUpdate&logout=1"><button class="logout">Log Out</button></a>
        </div>
        </header>
        <div class="main">
            <div class="control-panel">
                <div class="select-database">
                    <a href="inventory.php?database=LastUpdate"><button class="database">History</button></a>
                    <a href="inventory.php?database=Computer"><button class="database">Computer</button></a>
                    <a href="inventory.php?database=Video"><button class="database">Video</button></a>
                    <a href="inventory.php?database=Audio"><button class="database">Audio</button></a>
                    <a href="inventory.php?database=Commutation"><button class="database">Commutation</button></a>
                    <a href="inventory.php?database=Others"><button class="database">Others</button></a>
                </div>
                <div class="search">
                    <input type="text">
                    <div class="search-ico"></div>
                </div>
            </div>


            <div class="add-edit-panel" onclick="event.stopPropagation()">
               <span>Add/Edit Element</span>
                <form action="<?php echo $gotoparam ?>" method="post">
                    <div class="line">
                        <div class="colum id">
                            <label for="">ID</label>
                            <input type="number" name="id" id="id" required value="<?php echo $currentID ?>">
                        </div>
                        <div class="colum name">
                            <label for="">Name</label>
                            <input type="text" name="name" id="name" required autocomplete="off">
                        </div>
                        <div class="colum quantity">
                            <label for="">Quantity</label>
                            <input type="number" name="quantity" id="quantity" required value="1">
                        </div>
                        <div class="colum price">
                            <label for="">Price</label>
                            <input type="number" name="price" id="price" required>
                        </div>
                        <div class="colum state">
                            <label for="">State</label>
                            <select name="state" id="state" size="1">
                                <option value="0">В работе</option>
                                <option value="1">Необходим ремонт</option>
                                <option value="2">Ремонту не подлежит</option>
                            </select>
                        </div>
                        <div class="colum comment">
                            <label for="">Comment</label>
                            <input type="text" name="comment" id="comment" autocomplete="off">
                        </div>
                    </div>
                    <button class="add-edit">Save</button>
                </form>
            </div>



            <div class="current-database">
                <div class="table-line table-line-first">
                    <div class="table-id table-colum">ID</div>
                    <div class="table-name table-colum">Name</div>
                    <div class="table-quantity table-colum">Quantity</div>
                    <div class="table-price table-colum">Price</div>
                    <div class="table-state table-colum">State</div>
                    <div class="table-comment table-colum">Comment</div>
                </div>
                <?php 
                        if($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                              if($currentDataBase != 'LastUpdate') {
                                echo '<div class="table-line"><div class="table-id table-colum">'.$row["id"].'</div><div class="table-name table-colum">'.$row["name"].'</div><div class="table-quantity table-colum">'.$row["quantity"].'</div><div class="table-price table-colum">'.$row["price"].'</div><div class="table-state table-colum">'.$row["state"].'</div><div class="table-comment table-colum">'.$row["comment"].'</div></div>'; 
                              } else {
                                  echo '<div class="table-line"><div class="table-id table-colum">'.$row["date"].'</div><div class="table-name table-colum">'.$row["id"].'</div><div class="table-quantity table-colum">'.$row["name"].'</div><div class="table-price table-colum">'.$row["changed"].'</div><div class="table-state table-colum">'.$row["state"].'</div><div class="table-comment table-colum">'.$row["comment"].'</div></div>'; 
                              }
                          };
                        };
                    ?>
            </div>
        </div>
    </div>
    <script src="js/inventory.js"></script>
</body>

</html>
