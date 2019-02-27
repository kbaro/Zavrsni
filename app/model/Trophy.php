<?php

class Trophy
{

    public static function read()
    {
        $db = Db::getInstance();
        $expression = $db->prepare("
        
                    select 
                    a.id,
                    a.team,
                    a.league_name,
                    a.cup_name,
                    a.supercup_name,
                    a.times_won_league,
                    a.times_won_cup,
                    a.times_won_supercup,
                    count(b.id) as total from 
                    trophy a left join team b on a.id=b.trophy
                    group by 
                    a.id,
                    a.team,
                    a.league_name,
                    a.cup_name,
                    a.supercup_name,
                    a.times_won_league,
                    a.times_won_cup,
                    a.times_won_supercup
                    order by a.team

        ");
        $expression->execute();
        return $expression->fetchAll();
    }

    public static function find($id)
    {
        $db = Db::getInstance();
        $expression = $db->prepare("select * from trophy where id=:id");
        $expression->execute(["id"=>$id]);
        return $expression->fetch();
    }

    public static function add()
    {
        $db = Db::getInstance();
        $expression = $db->prepare("insert into trophy (team,league_name,cup_name,supercup_name,times_won_league,times_won_cup,times_won_supercup) 
        values (:team,:league_name,:cup_name,:supercup_name,:times_won_league,:times_won_cup,:times_won_supercup)");
        $expression->execute(self::data());
    }

    public static function update($id)
    {
        $db = Db::getInstance();
        $expression = $db->prepare("update trophy set 
        team=:team,
        league_name=:league_name,
        cup_name=:cup_name,
        supercup_name=:supercup_name,
        times_won_league=:times_won_league,
        times_won_cup=:times_won_cup,
        times_won_supercup=:times_won_supercup
        where id=:id");
        $data = self::data();
        $data["id"]=$id;
        $expression->execute($data);
    }

    public static function delete($id)
    {
        $db = Db::getInstance();
        $expression = $db->prepare("delete from trophy where id=:id");
        $data = [];
        $data["id"]=$id;
        $expression->execute($data);
    }

    private static function data(){
        return [
            "team"=>Request::post("team"),
            "league_name"=>Request::post("league_name"),
            "cup_name"=>Request::post("cup_name"),
            "supercup_name"=>Request::post("supercup_name"),
            "times_won_league"=>Request::post("times_won_league"),
            "times_won_cup"=>Request::post("times_won_cup"),
            "times_won_supercup"=>Request::post("times_won_supercup")
        ];
    }


}