<?php
class UserController{
    function singup(){
        $view = new View();
        $view->render('register',["message"=>""]);
    }
    function register()
    {
        $db=Db::getInstance();
        $expression = $db->prepare("select username,email,password from users where email=:email");
        $expression->execute(["email"=>Request::post("email")]);
        $view = new View();

    }

}


/*<?php

public function signup()
{

     session_start();
       if($_POST["username"] && $_POST["email"] && $_POST["password"]);
}

{
    {
        $servername="localhost";
        $username="kbaro";
        $password="kbaro";
        $conn=  mysql_connect($servername,$username,$password)or die(mysql_error());
        mysql_select_db("users",$conn);
        $sql="insert into users (username,email,password)values('$_POST[username]','$_POST[email]','$_POST[password]')";
        $result=mysql_query($sql,$conn) or die(mysql_error());
        print "<h1>you have registered successfully</h1>";

        print "<a href='Session.php'>Go to login page</a>";
    }
    else print "Passwords doesnt match";
}
else print"Invalid input data";

?>
*/