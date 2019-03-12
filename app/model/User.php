<?php

class User{

    public static function read(){
        $db = Db::getInstance();
        $expression = $db->prepare("select id,username,email from user");
        $expression->execute();
        return $expression->fetchAll();
    }




}