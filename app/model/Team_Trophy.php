<?php

class Team_Trophy
{

        public static function read()
        {
            $db = Db::getInstance();
            $expression = $db->prepare("
        
                    select
                    a.id,
                    a.team,
                    a.trophy,
                    a.times_won,
                    b.trophy_name,
                    c.title
                    from team_trophy as a
                    inner join trophy b on b.id = a.team
                    inner join team c on c.id = a.team
                    
        
        ");
            $expression->execute();
            return $expression->fetchAll();
        }
}
