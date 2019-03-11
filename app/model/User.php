<?php

    class User
    {

        public function register($username, $email, $password)
        {
            if ($username == null || $email == null || $password == null)
                return 0;

            $password = password_hash($password);

            $db = DB::getInstance();
            $izraz = $db->prepare("insert into user (username,email,password)
            values ($username,$email,$password)");
            $izraz->execute();

        }

    }
