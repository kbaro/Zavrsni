<?php

class AdminController{
    function signin(){
        $view = new View();
        $view->render('login',["message"=>""]);
    }

    function login()
    {
        $db=Db::getInstance();
        $expression = $db->prepare("select name,surname,role,email,password from operator where email=:email");
        $expression->execute(["email"=>Request::post("email")]);
        $view = new View();
        if($expression->rowCount()>0){
            $row=$expression->fetch();
            if(password_verify(Request::post("password"),$row->password)){
                $user = new stdClass();
                $user->name=$row->name;
                $user->surname=$row->surname;
                $user->role=$row->role;
                $user->email=$row->email;
                $user->nameSurname=$row->name . " " . $row->surname;
                Session::getInstance()->login($user);

                // $view->render('index',["message"=>"Welcome"]);

                $pr = new OperatorController();
                $pr->index();

            }else{
                $view->render('signin',["message"=>"Email or password do not match"]);
            }
        }else{
               $view->render('signin',["message"=>"Wrong E-mail"]);
         }
    //
  }
    function logout()
    {
        Session::getInstance()->logout();
        $view = new View();
        $view->render('index',["message"=>""]);
    }

    function registration()
                {
                    $view = new View();
                    $view->render('registration',["message"=>""]);

                }
                function register()
                {
                    $db = Db::getInstance();
                    $expression = $db->prepare("insert into operator (name,surname,email,password) values (:name,:surname,:email,:password)");
                    $expression->bindValue('name', Request::post("name"));
                    $expression->bindValue('surname', Request::post("surname"));
                    $expression->bindValue('email', Request::post("email"));
                    $expression->bindValue('password', password_hash(Request::post("password"),PASSWORD_DEFAULT));
                    $expression->execute();



                    Session::getInstance()->logout();
                    $view = new View();
                    $view->render('login',["message"=>"Success"]);

                }
}
