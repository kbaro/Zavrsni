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

    public function saveImage($id)
    {
        $img = Request::post("picture");
        $img = str_replace('data:image/png;base64,', '', $img);
        $img = str_replace(' ', '+', $img);
        $data = base64_decode($img);
        file_put_contents(App::config("path") . "public/img/players/" . $id . ".png",$data);
        echo "Ok";
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

        if (Request::post("surname") === "") {
            return "Surname required";
        }

        if (Request::post("nationality") === "") {
            return "Nationality required";
        }

        if (Request::post("positions") === "") {
            return "Position required";
        }

        if (Request::post("salary") === "") {
            return "Salary required";
        }

        if (Request::post("team") === "") {
            return "Team required";
        }

        if (strlen(Request::post("name")) > 50) {
            return "Name can't be longer than 50 characters";
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
        $_POST["positions"] = $player->positions;
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

    function search()
    {
        $view = new View();
        $view->render('players/index' , ["players" => Player::search()]);

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

