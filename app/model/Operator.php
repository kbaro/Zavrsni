<?php

class Operator{

    public static function read(){
        $db = Db::getInstance();
        $expression = $db->prepare("select id,
                                                    name,
                                                    surname,
                                                    favorite_team,
                                                    email,
                                                    role
                                                   
                                    
                                                    from operator
                                                    
                                                    


");
        $expression->execute();
        return $expression->fetchAll();
    }

    public static function readAll(){
        $db = Db::getInstance();
        $expression = $db->prepare("select a.id,
                                                    a.name,
                                                    a.surname,
                                                    a.favorite_team,
                                                    a.email,
                                                    a.role,
                                                    b.logo
                                                     
                                                    from operator a
                                                    left join team as b on b.id = a.favorite_team
                                                   
");
        $expression->execute();
        return $expression->fetchAll();
    }

    public static function find($id)
    {
        $db = Db::getInstance();
        $expression = $db->prepare("select * from operator where id=:id");
        $expression->execute(["id"=>$id]);
        return $expression->fetch();
    }

    public static function update($id)
    {
        $db = Db::getInstance();
        $expression = $db->prepare("update operator set 
        name=:name,
        surname=:surname,
        favorite_team=:favorite_team,
        email=:email
        where id=:id");
        $data = self::data();
        $data["id"]=$id;
        $expression->execute($data);
    }

    public static function delete($id)
    {
        $db = Db::getInstance();
        $expression = $db->prepare("delete from operator where id=:id");
        $data = [];
        $data["id"]=$id;
        $expression->execute($data);
    }

    private static function data(){
        return [
            "name"=>Request::post("name"),
            "surname"=>Request::post("surname"),
            "favorite_team"=>Request::post("favorite_team"),
            "email"=>Request::post("email")
        ];
    }




}