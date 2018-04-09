<?php

    class AssessmentObject
    {
        protected $id;
        protected $name;
        protected $description;
        protected $taken;
        protected $on_page;
        protected $num_questions;
        protected $num_answers;
        protected $interest_areas;
        protected $submitted;

        /**
        * Accept an array of data matching properties of this class
        * and create the class
        *
        * @param array $data The data to use to create
        */
        public function __construct(array $data) {
            $this->id = $data['id'];
            $this->name = $data['assessment_name'];
            $this->description = $data['description'];
            $this->taken = false;
            if($data['form_id']) { $this->taken = true; }
            if($data['on_page']) { $this->on_page = $data['on_page']; }
            else { $this->on_page = 1; }
            $this->num_questions = $data['num_questions'];
            $this->num_answers = $data['num_answers'];
            $this->submitted = $data['submitted'];

            $this->interest_areas = array();
        }

        public function getId() {
            return $this->id;
        }

        public function getName() {
            return $this->name;
        }

        public function getDescription() {
            return $this->description;
        }

        public function taken() {
            return $this->taken;
        }

        public function getNumQuestions() {
            return $this->num_questions;
        }

        public function getNumAnswers() {
            return $this->num_answers;
        }

        public function getInterestAreas() {
            return $this->interest_areas;
        }

        public function getOnPage() {
            return $this->on_page;
        }

        public function getSubmitted() {
            return $this->submitted;
        }

        public function getPercentComplete() {
            $percent_complete = 0;
            if($this->getNumQuestions()) {
                $percent_complete = number_format(($this->getNumAnswers() / $this->getNumQuestions()) * 100, 1);
            }

            return $percent_complete;
        }

        public function addInterestArea($interest_area) {
            $this->interest_areas[] = $interest_area;
        }
    }

?>
