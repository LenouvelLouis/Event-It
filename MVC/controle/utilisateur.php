<?php
function closedNotifier(){
    unset($_SESSION['msgAcc']);
    unset($_SESSION['msgErr']);
    unset($_SESSION['msgType']);
}
?>