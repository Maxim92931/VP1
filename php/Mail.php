<?php

require '../vendor/autoload.php';

class Mail {
    public static function sendMail($address, $subject, $message)
    {
        $mail = new PHPMailer;

        //$mail->SMTPDebug = 3;                               // Enable verbose debug output

        $mail->isSMTP();                                      // Set mailer to use SMTP
        $mail->Host = 'smtp.yandex.ru';  // Specify main and backup SMTP servers
        $mail->SMTPAuth = true;                               // Enable SMTP authentication
        $mail->Username = 'proekt92931@yandex.ru';                 // SMTP username
        $mail->Password = 'wolf2580369';                           // SMTP password
        $mail->SMTPSecure = 'ssl';                            // Enable TLS encryption, `ssl` also accepted
        $mail->Port = 465;                                    // TCP port to connect to

        $mail->setFrom('proekt92931@yandex.ru', 'Mailer');
        $mail->addAddress($address, 'Joe User');     // Add a recipient
        $mail->addAddress($address);               // Name is optional
        $mail->addReplyTo('proekt92931@yandex.ru', 'Information');
        $mail->addCC('cc@example.com');
        $mail->addBCC('bcc@example.com');

        $mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
        $mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name
        $mail->isHTML(true);                                  // Set email format to HTML

        $mail->Subject = $subject;
        $mail->Body    = $message;
        //$mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

        $result = null;

        if(!$mail->send()) {
            $result = 'Message could not be sent. Mailer Error: ' . $mail->ErrorInfo;
        } else {
            $result = 'Message has been sent';
        }

        return $result;
    }
}