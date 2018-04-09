<?php

    class InterestAreaObject
    {
        protected $id;
        protected $name;
        protected $questions;

        /**
        * Accept an array of data matching properties of this class
        * and create the class
        *
        * @param array $data The data to use to create
        */
        public function __construct(array $data) {
            // no id if we're creating
            if(isset($data['interest_area_id'])) {
                $this->id = $data['interest_area_id'];
            }
            $this->name = $data['interest_area_name'];
            $questions = array();
        }

        public function getId() {
            return $this->id;
        }

        public function getName() {
            return $this->name;
        }

        public function getQuestions() {
            return $this->questions;
        }

        public function addQuestion($question) {
            $this->questions[] = $question;
        }
    }

?>
