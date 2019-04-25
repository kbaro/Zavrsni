<?php

class FixturesController extends ProtectedController{



    function index($page = 1)
    {

        if ($page <= 0) {
            $page = 1;
        }
        if ($page === 1) {
            $previous = 1;
        }
        if ($page > 100){
            $page = 1;
        } else {
            $previous = $page - 1;
        }
        $next = $page + 1;

        $view = new View();
        $view->render(
            'fixtures/index',
            [
                "fixtures"=>Fixtures::read($page),
                "previous" => $previous,
                "next" => $next
            ]
        );
    }

    function edit($id)
    {
        $_POST["id"] = $id;
        $control = $this->control();
        if ($control === true) {
            Fixtures::update($id);
            $this->index();
        } else {
            $view = new View();
            $view->render(
                'fixtures/edit',
                [
                    "message" => $control
                ]
            );
        }

    }

    function control()
    {
        if (Request::post("home_goals") === "") {
            return "Goals required";
        }

        if (Request::post("away_goals") === "") {
            return "Goals required";
        }


        return true;
    }

    function prepareadd()
    {
        $view = new View();
        $view->render(
            'fixtures/new',
            [
                "message" => ""
            ]
        );
    }

    function prepareedit($id)
    {
        $view = new View();
        $fixtures = Fixtures::find($id);
        $_POST["home_goals"] = $fixtures->home_goals;
        $_POST["away_goals"] = $fixtures->away_goals;
        $_POST["id"] = $fixtures->id;

        $view->render(
            'fixtures/edit',
            [
                "message" => ""
            ]
        );
    }
	


}