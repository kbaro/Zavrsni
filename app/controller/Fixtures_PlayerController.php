<?php

class Fixtures_PlayerController extends ProtectedController{

    function index(){
        $view = new View();
        $view->render(
            'fixtures_player/index',
            [
                "fixtures_player"=>Fixtures_Player::read()
            ]
        );
    }

}