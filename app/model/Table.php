<?php

class Table
{

    public static function read()
    {
        $db = Db::getInstance();
        $expression = $db->prepare("
        
           select 
                a.id,
                b.id,
                d.title as team,
                a.wins,
                a.draws,
                a.losses,
                a.points
                
                from league_table a
                left join fixtures b on b.id = a.fixtures
                left join team d on d.id = a.team

        ");
        $expression->execute();
        return $expression->fetchAll();
    }
}