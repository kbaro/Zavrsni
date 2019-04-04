<?php

class Positions
{

    public static function read()
    {
        $db = Db::getInstance();
        $expression = $db->prepare("
            
                                select
                                id,
                                position_name
                                from positions    
            ");
        $expression->execute();
        return $expression->fetchAll();
    }
}