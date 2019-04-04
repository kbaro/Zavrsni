<?php

class Manager
{

    public static function read()
    {
        $db = Db::getInstance();
        $expression = $db->prepare("
            
                                select
                                id,
                                name,
                                surname
                                from manager    
            ");
        $expression->execute();
        return $expression->fetchAll();
    }
}
