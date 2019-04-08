<?php

    class Team_TrophyController extends ProtectedController{

        public function index(){
        $view = new View;
        $view ->render("trophys/team_trophy" , ["team_trophys" => Team_Trophy::read]);
                
                }
                }