<?php

class TrophyController extends ProtectedController
{
    function add()
    {

        $control = $this->control();
        if($control===true){
            Trophy::add();
            $this->index();
        }else{
            $view = new View();
            $view->render(
                'trophys/new',
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
            Trophy::update($id);
            $this->index();
        }else{
            $view = new View();
            $view->render(
                'trophys/edit',
                [
                    "message"=>$control
                ]
            );
        }

    }

    function delete($id)
    {
        Trophy::delete($id);
        $this->index();
    }

    function control()
    {
        if(Request::post("league_name")===""){
            return "League name required";
        }

        if(strlen(Request::post("league_name"))>50){
            return "League name can't be longer than 50 characters";
        }

        $db = Db::getInstance();
        $expression = $db->prepare("select count(id) from trophy where league_name=:league_name and id<>:id");
        $expression->execute(["title"=>Request::post("league_name"), "id" => Request::post("id")]);
        $total = $expression->fetchColumn();
        if($total>0){
            return "League name already exists.";
        }


        return true;
    }

    function prepareadd()
    {
        $view = new View();
        $view->render(
            'trophys/new',
            [
                "message"=>""
            ]
        );
    }

    function prepareedit($id)
    {
        $view = new View();
        $trophy = Trophy::find($id);
        $_POST["team"]=$trophy->team;
        $_POST["league_name"]=$trophy->league_name;
        $_POST["cup_name"]=$trophy->cup_name;
        $_POST["supercup_name"]=$trophy->supercup_name;
        $_POST["times_won_league"]=$trophy->times_won_league;
        $_POST["times_won_cup"]=$trophy->times_won_cup;
        $_POST["times_won_supercup"]=$trophy->times_won_supercup;
        $_POST["id"]=$trophy->id;

        $view->render(
            'trophys/edit',
            [
                "message"=>""
            ]
        );
    }


    function index(){
        $view = new View();
        $view->render(
            'trophys/index',
            [
                "teams"=>Trophy::read()
            ]
        );
    }
}