<?php

    class InterestAreaMapper extends Mapper
    {
        /**
        * Gets the nth interest area
        *
        * @param $assessment_id the interest area
        * @param $page the nth interest area of the assessment
        * @return InterestAreaObject
        */
        public function getInterestAreaByPage($assessment_id, $page) {
            // get ID of nth interest area
            $sql = "SELECT id AS interest_area_id
            FROM interest_areas
            WHERE assessment_id = :assessment_id
            ORDER BY id LIMIT ". ((int)$page-1) .", 1";
            $stmt = $this->db->prepare($sql);
            $result = $stmt->execute(["assessment_id"=>$assessment_id]);
            $row = $stmt->fetch();
            $interest_area_id = $row['interest_area_id'];

            // get interest area and question/answers
            $sql = "SELECT ia.id AS interest_area_id, ia.interest_area_name, q.id AS question_id, q.question_text, a.id AS answer_id, a.answer_text, fa.id AS form_answer_id
            FROM interest_areas ia JOIN questions q ON q.interest_area_id = ia.id
            JOIN answers a ON a.question_id = q.id
            LEFT JOIN form_answers fa ON fa.answer_id = a. id
            LEFT JOIN forms f ON f.id = fa.form_id AND f.user_id = :user_id
            WHERE q.interest_area_id = :interest_area_id
            ORDER BY ia.id, q.id, a.id";
            $stmt = $this->db->prepare($sql);
            $result = $stmt->execute(["user_id"=>$_SESSION['user_id'], "interest_area_id"=>$interest_area_id]);

            $interest_area;
            $question = new QuestionObject(array());
            while($row = $stmt->fetch()) {
                if(!$interest_area) {
                    $interest_area = new InterestAreaObject($row);
                }

                // new question
                if($question->getId() != $row['question_id']) {
                    $question = new QuestionObject($row);
                    $interest_area->addQuestion($question);
                }

                $answer = new AnswerObject($row);
                $question->addAnswer($answer);
            }

            return $interest_area;
        }

        /**
        * Saves the answers to the database
        *
        * @param $interest_area the interest area object
        * @param $form_id the form the answers will be saved to
        * @param $data the submitted data
        */
        public function save(InterestAreaObject $interest_area, $form_id, $data) {
            $questions = $interest_area->getQuestions();
            foreach($questions as $question) {
                // delete any current answers
                $sql = "DELETE fa
                FROM form_answers fa JOIN answers a ON a.id = fa.answer_id
                JOIN questions q on q.id = a.question_id
                WHERE q.id = :id";
                $stmt = $this->db->prepare($sql);
                $result = $stmt->execute(['id'=>$question->getId()]);

                $id = 'Q'. $question->getId();
                if($data[$id]) {
                    // insert new answer
                    $sql = "INSERT INTO form_answers
                    (form_id, answer_id) VALUES
                    (:form_id, :answer_id)";
                    $stmt = $this->db->prepare($sql);
                    $result = $stmt->execute(["form_id" => $form_id, "answer_id" => $data[$id]]);

                    if(!$result) {
                        throw new Exception("could not save record");
                    }
                }
            }
        }
    }

?>
