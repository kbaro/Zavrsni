<?php
class UserController{
    function singup(){
        $view = new View();
        $view->render('register',["message"=>""]);
    }
    function register()
    {
        $db=Db::getInstance();
        $expression = $db->prepare("select first_name,last_name,email,password from users where email=:email");
        $expression->execute(["email"=>Request::post("email")]);
        $view = new View();
        if($expression->rowCount()>0){
            $row=$expression->fetch();
            if(password_verify(Request::post("password"),$row->password)){
                $user = new stdClass();
                $user->first_name=$row->first_name;
                $user->last_name=$row->last_name;
                $user->email=$row->email;
                $user->nameSurname=$row->name . " " . $row->surname;
                Session::getInstance()->register($user);
                $view->render('index',["message"=>"Welcome"]);
            }else{
                $view->render('singup',["message"=>"Email or password do not match"]);
            }
        }else{
            $view->render('singup',["message"=>"Wrong E-mail"]);
        }

    }

}