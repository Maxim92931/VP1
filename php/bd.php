<?php

function authorization($connection, $email, $name, $phone) : int
{
    try {
        $stmt = $connection->prepare("INSERT INTO Users (Name, Phone, Email) VALUES (:name, :phone, :email)");

        $result = $stmt->execute([
            ':name' => $name,
            ':phone' => $phone,
            ':email' => $email
        ]);

        if ($result) {
            $userId = $connection->lastInsertId();
        } else {
            $stmt = $connection->prepare("SELECT id FROM Users WHERE Email = :email");
            $stmt->execute([':email' => $email]);
            $userId = $stmt->fetch(PDO::FETCH_ASSOC)['id'];
        }

        return $userId;
    } catch (PDOException $ex) {
        echo $ex->getMessage();
        die();
    }
}

function checkout($userId, $address, $comment, $isPayForCard, $isCallback, $connection) : int
{
    try {
        $stmt = $connection->prepare("INSERT INTO Orders (Address, User_id, Comment, isPayForCard, isCallback)" .
            "VALUES (:address, :user_id, :comment, :isPayForCard, :isCallback)");

        $result = $stmt->execute([
            ':address' => $address,
            ':user_id' => $userId,
            ':comment' => $comment,
            ':isPayForCard' => $isPayForCard,
            ':isCallback' => $isCallback
        ]);

        if ($result) {
            $orderId = $connection->lastInsertId();
        }

        return $orderId;
    } catch (PDOException $ex) {
        echo $ex->getMessage();
        die();
    }
}

function getOrderCount($userID, $connection) {
    try {
        $stmt = $connection->prepare("SELECT COUNT(*) FROM Orders WHERE User_id = :userId");
        $stmt->execute([':userId' => $userID]);

        return $stmt->fetch()[0];
    } catch (PDOException $ex) {
        echo $ex->getMessage();
        die();
    }
}