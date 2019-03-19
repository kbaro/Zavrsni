<?php

    class Search{

        private $dsn;
        public function __construct($dsn)
        {
            $this->dsn = $dsn;

        }

        public function getNumResults($term)
        {
            $query = $this->dsn->prepare("SELECT COUNT (*) as total FROM player where name like :term
                                    OR surname like :term
                                    OR nationality like :term
                                    OR position like :term
                                    OR team like :term
            ");

            $searchTerm = "%". $term ."%";
            $query->bindParam(":term",$searchTerm);
            $query->execute();

            $row = $query->fetch(PDO::FETCH_ASSOC);
            return $row("total");
        }

        public function getResults($page,$term){

            $query = $this->dsn->prepare("SELECT COUNT (*) as total FROM player where name like :term
                                    OR surname like :term
                                    OR nationality like :term
                                    OR position like :term
                                    OR team like :term
            ");

            $searchTerm = "%". $term ."%";
            $query->bindParam(":term",$searchTerm);
            $query->execute();

            $results = "<div class='results'>";



            $results = "</div>";

        }

    }

