<?php

class Trophy
{

    public static function read()
    {
        $db = Db::getInstance();
        $expression = $db->prepare("
        
                    select 
                    id,
                    trophy_name,
                    photo
                   from trophy

        ");
        $expression->execute();
        return $expression->fetchAll();
    }






}