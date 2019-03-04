<?php

class Player
{

    public static function read($page)
    {
        $perPage=7;
        $db = Db::getInstance();
        $expression = $db->prepare("
        
                    select 
                    a.id,
                    a.name,
                    a.surname,
                    a.nationality,
                    a.position,
                    a.salary,
                    a.team,
                    b.title
                    from player as a left join team as b on b.id = a.team
                    group by 
                    a.id,
                    a.name,
                    a.surname,
                    a.nationality,
                    a.position,
                    a.salary,
                    a.team
                    order by a.team
                    limit ". (($page*$perPage)- $perPage)  . ",$perPage

        ");
        $expression->execute();
        //echo "<pre>";print_r($expression->fetchAll());exit;
        return $expression->fetchAll();
    }

    public static function find($id)
    {
        $db = Db::getInstance();
        $expression = $db->prepare("select * from player where id=:id");
        $expression->execute(["id"=>$id]);
        return $expression->fetch();
    }

    public static function add()
    {
        $db = Db::getInstance();
        $expression = $db->prepare("insert into player (name,surname,nationality,position,salary,team) 
        values (:name,:surname,:nationality,:position,:salary,:team)");
        $expression->execute(self::data());
    }

    public static function update($id)
    {
        $db = Db::getInstance();
        $expression = $db->prepare("update player set 
        name=:name,
        surname=:surname,
        nationality=:nationality,
        position=:position,
        salary=:salary,
        team=:team
        where id=:id");
        $data = self::data();
        $data["id"]=$id;
        $expression->execute($data);
    }

    public static function delete($id)
    {
        $db = Db::getInstance();
        $expression = $db->prepare("delete from player where id=:id");
        $data = [];
        $data["id"]=$id;
        $expression->execute($data);
    }

    private static function data(){
        return [
            "name"=>Request::post("name"),
            "surname"=>Request::post("surname"),
            "nationality"=>Request::post("nationality"),
            "position"=>Request::post("position"),
            "salary"=>Request::post("salary"),
            "team"=>Request::post("team")
        ];
    }


}