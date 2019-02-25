<?php

class Operator{

    public static function read(){
        $db = Db::getInstance();
        $expression = $db->prepare("select id,name,surname,email from operator");
        $expression->execute();
        return $expression->fetchAll();
    }

    


}