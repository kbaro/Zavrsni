<?php

 class Fixtures{

     public static function read($page)
     {
         $perPage=10;
         $db = Db::getInstance();
         $expression = $db->prepare("
            select
                                a.id,
                                DATE_FORMAT(f_date, '%e.%m.%Y') as f_date,
                                TIME_FORMAT(f_time, '%i:%H') as f_time,
                                d.title as home_team,
                                a.home_goals as home_goals_for,
                                       case 
                                         when home_goals > away_goals then 3
                                         when away_goals > home_goals then 0
                                         else 1
                                            end as home_points,
                                e.title as away_team,
                                a.away_goals as away_goals_for,
                                       case 
                                         when away_goals > home_goals then 3
                                         when home_goals > away_goals then 0
                                         else 1
                                            end as away_points,
                                b.referee_name as referee
                                from fixtures a
                                left join referee as b on b.id = a.referee
                                left join team as d on d.id = a.home_team
                                left join team as e on e.id = a.away_team
                              
                                  order by a.f_date
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

     public static function search()
     {
         $db=Db::getInstance();
         if (isset($_POST['search'])){
             $searchq = $_POST['search'];
             $searchq = preg_replace("#[^0-9a-z]#i","",$searchq);

             $expression = $db->prepare("select * from fixtures where
             f_date like '%$searchq%'
             or home_team like '%$searchq%'
             or away_team like '%$searchq%'")
             or die("Could not search");
             $expression->execute();
             $count = $expression->rowCount();
             if ($count == 0){
                 return "There was no results!";
             }else{
                 return $expression->fetchAll();
             }
         }

     }

     public static function find($id)
     {
         $db = Db::getInstance();
         $expression = $db->prepare("select * from fixtures where id=:id");
         $expression->execute(["id"=>$id]);
         return $expression->fetch();
     }


     public static function add()
     {
         $db = Db::getInstance();
         $expression = $db->prepare("insert into fixtures (home_goals,away_goals) 
        values (:home_goals,:away_goals)");
         $expression->execute(self::data());
     }

     public static function update($id)
     {
         $db = Db::getInstance();
         $expression = $db->prepare("update fixtures set 
        home_goals=:home_goals,
        away_goals=:away_goals
        where id=:id");
         $data = self::data();
         $data["id"]=$id;
         $expression->execute($data);
     }

     private static function data(){
         return [
             "home_goals"=>Request::post("home_goals"),
             "away_goals"=>Request::post("away_goals")
         ];
     }

 }