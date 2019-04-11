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


}