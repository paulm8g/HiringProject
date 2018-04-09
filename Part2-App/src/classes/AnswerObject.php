<?php

    class AnswerObject
    {
        protected $id;
        protected $text;
        protected $selected;

        /**
        * Accept an array of data matching properties of this class
        * and create the class
        *
        * @param array $data The data to use to create
        */
        public function __construct(array $data) {
            $this->id = $data['answer_id'];
            $this->text = $data['answer_text'];
            $this->selected = false;
            if($data['form_answer_id']) { $this->selected = true; }
        }

        public function getId() {
            return $this->id;
        }

        public function getText() {
            return $this->text;
        }

        public function getSelected() {
            return $this->selected;
        }
    }

?>
