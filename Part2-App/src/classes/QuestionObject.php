<?php

    class QuestionObject
    {
        protected $id;
        protected $text;
        protected $answers;
        protected $selected_answer;

        /**
        * Accept an array of data matching properties of this class
        * and create the class
        *
        * @param array $data The data to use to create
        */
        public function __construct(array $data) {
            $this->id = $data['question_id'];
            $this->text = $data['question_text'];
            $this->answers = array();
        }

        public function getId() {
            return $this->id;
        }

        public function getText() {
            return $this->text;
        }

        public function getAnswers() {
            return $this->answers;
        }

        public function getSelectedAnswer() {
            return $this->answers[$this->selected_answer];
        }

        public function addAnswer($answer) {
            $answer_id = $answer->getId();
            $this->answers[$answer_id] = $answer;
            if($answer->getSelected()) { $this->selected_answer = $answer_id; }
        }
    }

?>
