<?php

class Session{

    private static $instance;
    private $user;

    public function __construct()
    {
        @session_start();
        if(isset($_SESSION["user"])){
            $this->user=$_SESSION["user"];
        }
    }


    public function register()
    {
        $password_hash = $password_hash($this->password, PASSWORD_DEFAULT);

        $sql = 'INSERT INTO  users (name, email, password_hash)
                VALUES (:name, :email, :password_hash)';

        $db = static::getDB();
        $stmt = $db->prepare($sql);

        $stmt->bindValue(':name', $this->name, PDO::PARAM_STR);
        $stmt->bindValue(':email', $this->email, PDO::PARAM_STR);
        $stmt->bindValue(':password_hash', $this->password_hash, PDO::PARAM_STR);

        $stmt->execute();
    }


    public function login($user)
    {
        $this->user=$user;
        $_SESSION['logiran'] = true;
        $_SESSION["user"] = $user;
    }

    public function getUser()
    {
        return $this->user;
    }

    public function logout()
    {
        unset($_SESSION['logiran']);
    }

    function isLogiran()
    {
        return isset($_SESSION['logiran']) ? true : false;
    }

    public static function getInstance()
    {
        if(is_null(self::$instance)) {
            self::$instance = new self();
        }

        return self::$instance;
    }



}