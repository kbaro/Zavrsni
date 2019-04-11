<?php

class Trophy
{

    public static function read()
    {
        $db = Db::getInstance();
        $expression = $db->prepare("
        
                    select 
                    id,
                    trophy_name,
                    photo
                   from trophy

        ");
        $expression->execute();
        return $expression->fetchAll();
    }

    public static function find($id)
    {
        $db = Db::getInstance();
        $expression = $db->prepare("select * from team_trophy where id=:id");
        $expression->execute(["id"=>$id]);
        return $expression->fetch();
    }

    public static function add()
    {
        $db = Db::getInstance();
        $expression = $db->prepare("insert into trophy (trophy_name,photo) 
        values (:trophy_name,:photo");
        $expression->execute(self::data());
    }

    public static function update($id)
    {
        $db = Db::getInstance();
        $expression = $db->prepare("update trophy set 
        trophy_name=:trophy_name,
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
            "trophy_name"=>Request::post("trophy_name"),
            "photo"=>Request::post("photo"),
        ];
    }


}