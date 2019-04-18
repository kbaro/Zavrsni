<?php

 class Fixtures{

     public static function read($page)
     {
         $perPage=10;
         $db = Db::getInstance();
         $expression = $db->prepare("
            
                                select
                                a.id,
                                a.f_date,
                                a.f_time,
                                a.home_team,
                                a.home_goals as home_goals_for,
                                       case 
                                         when home_goals > away_goals then 3
                                         when away_goals > home_goals then 0
                                         else 1
                                            end as home_points,
                                a.away_team,
                                a.away_goals as away_goals_for,
                                       case 
                                         when away_goals > home_goals then 3
                                         when home_goals > away_goals then 0
                                         else 1
                                            end as away_points,
                                a..referee as referee_name,
                                b.player as name
                                from fixtures a  
                                left join referee a on a.id = a.fixtures
                                left join player b on b.id = a.player
                                  order by f_date
                          limit ". (($page*$perPage)- $perPage)  . ",$perPage
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