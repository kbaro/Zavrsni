<?php

class OperatorController extends ProtectedController{

    function index(){
        $view = new View();
        $view->render(
            'operators/index',
            [
            "operators"=>Operator::readAll()
            ]
        );
    }

    public function saveImage($id)
    {
        $img = Request::post("picture");
        $img = str_replace('data:image/png;base64,', '', $img);
        $img = str_replace(' ', '+', $img);
        $data = base64_decode($img);
        file_put_contents(App::config("path") . "public/img/operators/" . $id . ".png",$data);
        echo "Ok";
    }

    function edit($id)
    {
        $_POST["id"] = $id;
        $control = $this->control();
        if ($control === true) {
            Operator::update($id);
            $this->index();
        } else {
            $view = new View();
            $view->render(
                'operators/edit',
                [
                    "message" => $control
                ]
            );
        }

    }

    function control()
    {
        if(Request::post("name")===""){
            return "Name required";
        }

        if(Request::post("surname")===""){
            return "Surname required";
        }

        if(Request::post("favorite_team")===""){
            return "Choose your favorite team.";
        }

        if(Request::post("email")===""){
            return "E-mail required.";
        }



        return true;
    }

    function delete($id)
    {
        Operator::delete($id);
        $this->index();
    }


    function prepareedit($id)
    {
        $view = new View();
        $operator = Operator::find($id);
        $_POST["name"] = $operator->name;
        $_POST["surname"] = $operator->surname;
        $_POST["favorite_team"] = $operator->favorite_team;
        $_POST["email"] = $operator->email;
        $_POST["id"] = $operator->id;

        $view->render(
            'operators/edit',
            [
                "message" => ""
            ]
        );
    }



}