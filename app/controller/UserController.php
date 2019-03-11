<?php
    class UserController{

        public function register()
        {
            $password_hash = $password_hash($this->password, PASSWORD_DEFAULT);

            $sql = 'INSERT INTO  users (username, email, password_hash)
                    VALUES (:username, :email, :password_hash)';

            $db = static::getDB();
            $stmt = $db->prepare($sql);

            $stmt->insert(':name', $this->username, PDO::PARAM_STR);
            $stmt->insert(':email', $this->email, PDO::PARAM_STR);
            $stmt->insert(':password_hash', $this->password_hash, PDO::PARAM_STR);

            $stmt->execute();
        }



/* <?php

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