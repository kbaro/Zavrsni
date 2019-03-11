<?php
    class UserController{

        function register()
        {
            $view = new View();
            $view->render('register',["message"=>""]);

        }

        function signup($username, $email, $password)
        {
            $username = Request::post("username");
            $email = Request::post("email");
            $password = Request::post("password");

            $user=new User();
            $user->register();

            $view->render('register',["message"=>"Success"]);
        }
    }

