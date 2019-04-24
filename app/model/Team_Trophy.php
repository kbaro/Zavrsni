<?php

class Team_Trophy
{

    public static function read($trophy)
    {
        $db = Db::getInstance();
        $expression = $db->prepare("
        
                    select
                    a.id,
                    a.team,
                    a.year_won,
                    a.trophy,
                    b.id,
                    b.trophy_name,
                    b.photo,
                    c.title
                    from team_trophy as a
                    inner join trophy b on b.id = a.trophy
                    inner join team c on c.id = a.team
                    where trophy=:trophy
                    order by a.year_won
        
        ");
        $getTrophy["trophy"] = $trophy;
        $expression->execute($getTrophy);
        return $expression->fetchAll();
    }



}