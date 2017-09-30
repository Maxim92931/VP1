<?php
    require_once "bd.php";
    require_once "../conf.php";

    try {
        $connection = new PDO("$host;dbname=$dbname;charset=$charset", $user, $pass);
    } catch (PDOException $ex) {
        echo $ex->getMessage();
        die();
    }

    $result = $connection->query("SELECT * FROM Users");
    $data = $result->fetchAll(PDO::FETCH_ASSOC);

    echo '<h3 align="center">Пользователи</h3>';
    echo '<table border="1px" cellspacing="0" title="Пользователи" align="center">';
    echo '<th>Id</th>';
    echo '<th>Name</th>';
    echo '<th>Phone</th>';
    echo '<th>Email</th>';

    foreach ($data as $user) {
        echo '<tr>';

        echo '<td>' . $user['id'] .'</td>';
        echo '<td>' . $user['Name'] .'</td>';
        echo '<td>' . $user['Phone'] .'</td>';
        echo '<td>' . $user['Email'] .'</td>';

        echo '</tr>';
    }

    echo '</table>';

    $result = $connection->query("SELECT Orders.id, Users.Name, Address, isPayForCard, isCallback FROM Orders" .
        " INNER JOIN Users ON Orders.User_id = Users.id");
    $data = $result->fetchAll(PDO::FETCH_ASSOC);

    echo '<h3 align="center">Заказы</h3>';
    echo '<table border="1px" cellspacing="0" title="Заказы" align="center">';
    echo '<th>Id</th>';
    echo '<th>Name</th>';
    echo '<th>Address</th>';
    echo '<th>Payment</th>';
    echo '<th>Callback</th>';

    foreach ($data as $order) {
        echo '<tr>';

        echo '<td>' . $order['id'] .'</td>';
        echo '<td>' . $order['Name'] .'</td>';
        echo '<td>' . $order['Address'] .'</td>';
        $payment = $order['isPayForCard'] == 1 ? 'Карта' : 'Наличные';
        echo '<td>' . $payment .'</td>';
        $callback = $order['isCallback'] == 1 ? 'Перезвонить' : 'Не перезванивать';
        echo '<td>' . $callback .'</td>';

        echo '</tr>';
    }

    echo '</table>';



