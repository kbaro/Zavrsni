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

}