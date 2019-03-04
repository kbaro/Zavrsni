<?php
class AdminController{
    function singin(){
        $view = new View();
        $view->render('login',["message"=>""]);
    }
    function login()
    {
        $db=Db::getInstance();
        $expression = $db->prepare("select name,surname,email,password from operator where email=:email");
        $expression->execute(["email"=>Request::post("email")]);
        $view = new View();
        if($expression->rowCount()>0){
            $row=$expression->fetch();
            if(password_verify(Request::post("password"),$row->password)){
                $user = new stdClass();
                $user->name=$row->name;
                $user->surname=$row->surname;
                $user->email=$row->email;
                $user->nameSurname=$row->name . " " . $row->surname;
                Session::getInstance()->login($user);
                $view->render('index',["message"=>"Welcome"]);
            }else{
                $view->render('login',["message"=>"Email or password do not match"]);
            }
        }else{
                          $view->render('login',["message"=>"Wrong E-mail"]);
                             }
    //
  }
    function logout()
    {
        Session::getInstance()->logout();
        $view = new View();
        $view->render('index',["message"=>""]);
    }
}