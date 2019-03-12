<?php
    class UserController{

        public function registration()
        {
            $view = new View();
            $view->render('registration',["message"=>""]);

        }
        public function register()
        {
            $db = Db::connect();
            $expression = $db->prepare("insert into user (username,email,password) values (:username,:email,:password)");
            $expression->bindValue('username', Request::post("username"));
            $expression->bindValue('email', Request::post("email"));
            $expression->bindValue('password', password_hash(Request::post("password"),PASSWORD_DEFAULT));
            $expression->execute();

            Session::getInstance()->logout();
            $view = new View();
            $view->render('login',["message"=>""]);

        }
    }

