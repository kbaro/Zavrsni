<?php

class Team
{

    public static function read()
    {
        $db = Db::getInstance();
        $expression = $db->prepare("
        
                    select 
                    a.id,
                    a.title,
                    a.manager,
                    a.ground,
                    a.ground_capacity,
                    a.since,
                    a.trophy,
                    a.city,
                    count(b.id) as total from 
                    team a left join trophy b on a.id=b.team
                    group by 
                    a.id,
                    a.title,
                    a.manager,
                    a.ground,
                    a.ground_capacity,
                    a.since,
                    a.trophy,
                    a.city
                    order by a.title

        ");
        $expression->execute();
        return $expression->fetchAll();
    }

    public static function find($id)
    {
        $db = Db::getInstance();
        $expression = $db->prepare("select * from team where id=:id");
        $expression->execute(["id"=>$id]);
        return $expression->fetch();
    }

    public static function add()
    {
        $db = Db::getInstance();
        $expression = $db->prepare("insert into team (title,manager,ground,ground_capacity,since,trophy,city) 
        values (:title,:manager,:ground,:ground_capacity,:since,:trophy,:city)");
        $expression->execute(self::data());
    }

    public static function update($id)
    {
        $db = Db::getInstance();
        $expression = $db->prepare("update team set 
        title=:title,
        manager=:manager,
        ground=:ground,
        ground_capacity=:ground_capacity,
        since=:since,
        trophy=:trophy,
        city=:city
        where id=:id");
        $data = self::data();
        $data["id"]=$id;
        $expression->execute($data);
    }

    public static function delete($id)
    {
        $db = Db::getInstance();
        $expression = $db->prepare("delete from team where id=:id");
        $data = [];
        $data["id"]=$id;
        $expression->execute($data);
    }

    private static function data(){
        return [
            "title"=>Request::post("title"),
            "manager"=>Request::post("manager"),
            "ground"=>Request::post("ground"),
            "ground_capacity"=>Request::post("ground_capacity"),
            "since"=>Request::post("since"),
            "trophy"=>Request::post("trophy"),
            "city"=>Request::post("city")
        ];
    }


}