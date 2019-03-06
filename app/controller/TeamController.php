<?php

class TeamController extends ProtectedController
{
    function add()
    {
        
        $control = $this->control();
        if($control===true){
            Team::add();
            $this->index();
        }else{
            $view = new View();
            $view->render(
                'teams/new',
                [
                "message"=>$control
                ]
            );
        }

    }

    function edit($id)
    {
        $_POST["id"]=$id;
        $control = $this->control();
        if($control===true){
            Team::update($id);
            $this->index();
        }else{
            $view = new View();
            $view->render(
                'teams/edit',
                [
                "message"=>$control
                ]
            );
        }

    }

    function delete($id)
    {
        Team::delete($id);
            $this->index();
    }

    function control()
    {
        if(Request::post("title")===""){
            return "Title required";
        }

        if(Request::post("manager")===""){
            return "Manager name required";
        }

        if(Request::post("ground")===""){
            return "Ground name required";
        }

        if(Request::post("ground_capacity")===""){
            return "Ground Capacity required";
        }

        if(Request::post("since")===""){
            return "Since required";
        }

        if(Request::post("city")===""){
            return "City required";
        }

        if(strlen(Request::post("title"))>50){
            return "Title can't be longer than 50 characters";
        }

        $db = Db::getInstance();
        $expression = $db->prepare("select count(id) from team where title=:title and id<>:id");
        $expression->execute(["title"=>Request::post("title"), "id" => Request::post("id")]);
        $total = $expression->fetchColumn();
        if($total>0){
            return "Title already exists.";
        }

        $db = Db::getInstance();
        $expression = $db->prepare("select count(id) from team where manager=:manager and id<>:id");
        $expression->execute(["manager"=>Request::post("manager"), "id" => Request::post("id")]);
        $total = $expression->fetchColumn();
        if($total>0){
            return "Manager already has team.";
        }

        $db = Db::getInstance();
        $expression = $db->prepare("select count(id) from team where ground=:ground and id<>:id");
        $expression->execute(["ground"=>Request::post("ground"), "id" => Request::post("id")]);
        $total = $expression->fetchColumn();
        if($total>0){
            return "Ground name already exists.";
        }

        return true;
    }

    function prepareadd()
    {
        $view = new View();
        $view->render(
            'teams/new',
            [
            "message"=>""
            ]
        );
    }

    function prepareedit($id)
    {
        $view = new View();
        $team = Team::find($id);
        $_POST["title"]=$team->title;
        $_POST["manager"]=$team->manager;
        $_POST["ground"]=$team->ground;
        $_POST["ground_capacity"]=$team->ground_capacity;
        $_POST["since"]=$team->since;
        $_POST["trophy"]=$team->trophy;
        $_POST["city"]=$team->city;
        $_POST["id"]=$team->id;

        $view->render(
            'teams/edit',
            [
            "message"=>""
            ]
        );
    }


    function index(){
        $view = new View();
        $view->render(
            'teams/index',
            [
            "teams"=>Team::read()
            ]
        );
    }
}