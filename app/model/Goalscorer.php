<?php

class Goalscorer
{

    public static function read()
    {
        $db = Db::getInstance();
        $expression = $db->prepare("
            
                                select
                                id,
                                fixtures,
                                player,
                                team
                                from goalscorer    
            ");
        $expression->execute();
        return $expression->fetchAll();
    }
}
