<?php
require './lib/PHPMailer/src/PHPMailer.php';
require './lib/PHPMailer/src/SMTP.php';
require './lib/PHPMailer/src/Exception.php';
function sendMail($name, $email,$title,$message)
{
    $mail = new PHPMailer\PHPMailer\PHPMailer;

    $mail->isSMTP();
    $mail->Host = 'smtp.gmail.com';
    $mail->SMTPAuth = true;
    $mail->Username = 'benjamin.conrad.sunset@gmail.com'; // Replace with your Gmail address
    $mail->Password = 'evrs pwja plkr ebwm'; // Replace with your Gmail password
    $mail->SMTPSecure = 'tls'; // Use 'ssl' if you prefer
    $mail->Port = 587; // Or 465 if you're using 'ssl'

    $mail->setFrom('no-reply@events-it.com', 'Events-it');
    $mail->addAddress($email, $name); // Replace with the recipient's email and name

    $mail->isHTML(true);

    $mail->Subject = $title;
    $mail->Body    = $message;

    if(!$mail->send()) {
        echo 'Message could not be sent.';
        echo 'Mailer Error: ' . $mail->ErrorInfo;
    } else {
        echo 'Message has been sent';
    }
}