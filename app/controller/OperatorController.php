<?php

class OperatorController extends ProtectedController{

    function index(){
        $view = new View();
        $view->render(
            'operators/index',
            [
            "operators"=>Operator::read()
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