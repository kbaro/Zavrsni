<?php

 class Fixtures{

     public static function read()
     {
         $db = Db::getInstance();
         $expression = $db->prepare("
            
                                select
                                id,
                                f_date,
                                f_time,
                                home_team,
                                away_team,
                                referee,
                                player
                                from fixtures    
            ");
         $expression->execute();
         return $expression->fetchAll();
     }

     function getResults($home_goals, $away_goals) {
         if ($home_goals > $away_goals) {
             $result = -1; // home win
         } else if ($home_goals < $away_goals) {
             $result = 1; // away win
         }
         return (int) empty($result) ? 0 : $result; // empty = draw
     }


}