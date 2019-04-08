<?php

class TrophyController extends ProtectedController
{

    public function index()
    {
        $view = new View;
        $view->render("trophys/trophy", ["trophys" => Trophy::read, "team_trophys" => Team_trophy::read]);
    }

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
        $expression = $db->prepare("select count(id) from team_trophy where trophy=:trophy and id<>:id");
        $expression->execute(["league_name"=>Request::post("trophy"), "id" => Request::post("id")]);
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
        $_POST["trophy_name"]=$trophy->trophy_name;
        $_POST["id"]=$trophy->id;

        $view->render(
            'trophys/edit',
            [
                "message"=>""
            ]
        );
    }

}