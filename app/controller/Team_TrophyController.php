<?php

class Team_trophyController extends ProtectedController{




    public function republicLeague()
    {

        $view = new View();
        $view->render("trophys/trophyWin", ["trophys" => Trophy::read(), "trophyWin" => Team_Trophy::read(1)]);

    }

    public function republicCup()
    {

        $view = new View();
        $view->render("trophys/trophyWin", ["trophys" => Trophy::read(), "trophyWin" => Team_Trophy::read(2)]);

    }

    public function republicSuperCup()
    {

        $view = new View();
        $view->render("trophys/trophyWin", ["trophys" => Trophy::read(), "trophyWin" => Team_Trophy::read(3)]);

    }


}