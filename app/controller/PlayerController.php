<?php

class PlayerController extends ProtectedController
{
    function add()
    {

        $control = $this->control();
        if ($control === true) {
            Player::add();
            $this->index();
        } else {
            $view = new View();
            $view->render(
                'players/new',
                [
                    "message" => $control
                ]
            );
        }

    }

    function edit($id)
    {
        $_POST["id"] = $id;
        $control = $this->control();
        if ($control === true) {
            Player::update($id);
            $this->index();
        } else {
            $view = new View();
            $view->render(
                'players/edit',
                [
                    "message" => $control
                ]
            );
        }

    }

    function delete($id)
    {
        Player::delete($id);
        $this->index();
    }

    function control()
    {
        if (Request::post("name") === "") {
            return "Name required";
        }

        if (strlen(Request::post("name")) > 50) {
            return "Name can't be longer than 50 characters";
        }

        $db = Db::getInstance();
        $expression = $db->prepare("select count(id) from player where name=:name and id<>:id");
        $expression->execute(["name" => Request::post("name"), "id" => Request::post("id")]);
        $total = $expression->fetchColumn();
        if ($total > 0) {
            return "Name already exists.";
        }


        return true;
    }

    function prepareadd()
    {
        $view = new View();
        $view->render(
            'players/new',
            [
                "message" => ""
            ]
        );
    }

    function prepareedit($id)
    {
        $view = new View();
        $player = Player::find($id);
        $_POST["name"] = $player->name;
        $_POST["surname"] = $player->surname;
        $_POST["nationality"] = $player->nationality;
        $_POST["position"] = $player->position;
        $_POST["salary"] = $player->salary;
        $_POST["team"] = $player->team;
        $_POST["id"] = $player->id;

        $view->render(
            'players/edit',
            [
                "message" => ""
            ]
        );
    }



    function index($page = 1)
    {
        if ($page <= 0) {
            $page = 1;
        }
        if ($page === 1) {
            $previous = 1;
        } else {
            $previous = $page - 1;
        }
        $next = $page + 1;

        $view = new View();
        $view->render(
            'players/index',
            [
                "players" => Player::read($page),
                "previous" => $previous,
                "next" => $next
            ]
        );
    }
}

