<?php
    require_once "../conf.php";
    require_once "bd.php";
    require_once "Mail.php";

    error_reporting(E_ALL);
    ini_set("display_errors", 1);

    try {
        $connection = new PDO("$host;dbname=$dbname;charset=$charset", $user, $pass);
    } catch (PDOException $ex) {
        echo $ex->getMessage();
        die();
    }

    //Авторизация пользователя
    $name = $_POST['name'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];

    $userId = authorization($connection, $email, $name, $phone);

    //Оформление заказа
    $address = 'Улица ' . $_POST['street'] . ' д. ' . $_POST['home'];

    if ($_POST['part'] != '') {
        $address .= ' корпус ' . $_POST['part'];
    }

    if ($_POST['appt'] != '') {
        $address .= ' кв. ' . $_POST['appt'];
    }

    if ($_POST['floor'] != '') {
        $address .= ' этаж ' . $_POST['floor'];
    }

    $comment = $_POST['comment'];
    $isPayForCard = isset($_POST['paymentCard']) ? 1 : 0;
    $isCallback = isset($_POST['callback']) ? 1 : 0;

    $orderId = checkout($userId, $address, $comment, $isPayForCard, $isCallback, $connection);

    if (($count = getOrderCount($userId, $connection)) == 1) {
        $orderCount = "Спасибо - это ваш первый заказ";
    } else {
        $orderCount = 'Спасибо! Это уже ' . $count . ' заказ';
    }

    $message = "<h1>Заказ №$orderId<h2><p>Ваш заказ будет доставлен по адресу: $address</p>" .
        "<p>DarkBeefBurger за 500 рублей, 1 шт</p><hr><p>$orderCount</p>";


    Mail::sendMail($email, "Бургеры", $message);
