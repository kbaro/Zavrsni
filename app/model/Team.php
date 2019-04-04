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
                    b.times_won_league,
                    b.times_won_cup,
                    b.times_won_supercup,
                    c.name,
                    c.surname as manager
                    from 
                    team a left join trophy b on a.id = b.team
                    left join manager c on c.id = a.manager
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

    public static function search()
    {
        $db=Db::getInstance();
        if (isset($_POST['search'])){
            $searchq = $_POST['search'];
            $searchq = preg_replace("#[^0-9a-z]#i","",$searchq);

            $expression = $db->prepare("select * from team where
             title like '%$searchq%'
             or manager like '%$searchq%'
             or city like '%$searchq%'")
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