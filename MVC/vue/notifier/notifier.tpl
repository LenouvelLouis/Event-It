<head>
    <link rel="stylesheet" href="./vue/notifier/notifier.css">
</head>
<div id="notification" onclick="closeNotifier()"  class="notification <?php echo (isset($_SESSION['msgType']) && !empty($_SESSION['msgType'])) ? 'show' : '' ?>">
    <div class="align-notif">
        <?php
          if (isset($_SESSION['msgType']) && $_SESSION['msgType'] == 'error') {
                echo '<i class="fa-solid fa-xmark  red"></i>';
        }
        if (isset($_SESSION['msgType']) && $_SESSION['msgType'] == 'success') {
        echo '<i  class="fa-solid fa-check green"></i>';
        }
        ?>
        <p  id="notification-message" class="<?php echo isset($_SESSION['msgType']) && isset($_SESSION['msgAcc']) ? 'green' : 'red' ?>">
            <?php
            if (isset($_SESSION['msgAcc'])) {
                echo $_SESSION['msgAcc'];
            } elseif (isset($_SESSION['msgErr'])) {
                echo $_SESSION['msgErr'];
            }
        ?>
        </p>
    </div>
</div>
<script src="./vue/notifier/notifier.js"></script>