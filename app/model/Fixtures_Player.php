<?php

class Fixtures_Player
{

    public static function read()
    {
        $db = Db::getInstance();
        $expression = $db->prepare("
            
                                select
                                id,
                                fixtures,
                                team,
                                player
                                from fixtures_player    
            ");
        $expression->execute();
        return $expression->fetchAll();
    }
}
