<?php

    class AssessmentMapper extends Mapper
    {
        /**
        * Get all of the active assessments
        *
        * @return an array of assessment objects
        */
        public function getAssessments() {
            $sql = "SELECT a.id, a.assessment_name, a.description, f.id AS form_id, f.on_page, f.submitted, nq.num_questions,
            COUNT(fa.id) AS num_answers
            FROM assessments a LEFT JOIN forms f ON f.assessment_id = a.id AND f.user_id = :user_id
            LEFT JOIN form_answers fa ON fa.form_id = f.id
            LEFT JOIN (SELECT ia.assessment_id, COUNT(q.id) AS num_questions
            FROM interest_areas ia JOIN questions q ON q.interest_area_id = ia.id GROUP BY ia.assessment_id
            ) nq ON nq.assessment_id = a.id
            WHERE a.active = 1
            GROUP BY a.id, a.assessment_name, a.description, f.id";
            $stmt = $this->db->prepare($sql);
            $stmt->execute(["user_id"=>$_SESSION['user_id']]);

            // create list of assessments
            $results = [];
            while($row = $stmt->fetch()) {
                $results[] = new AssessmentObject($row);
            }
            return $results;
        }

        /**
        * Get one assessment by its ID
        *
        * @param int $assessment_id The ID of the assessment
        * @return  The assessment
        */
        public function getAssessementById($assessment_id) {
            // get interest area and question/answers
            $sql = "SELECT a.id, a.assessment_name, ia.id as interest_area_id, ia.interest_area_name, q.id AS question_id, q.question_text, an.id AS answer_id, an.answer_text, fa.id AS form_answer_id
            FROM assessments a JOIN interest_areas ia ON ia.assessment_id = a.id
            JOIN questions q ON q.interest_area_id = ia.id
            JOIN answers an ON an.question_id = q.id
            LEFT JOIN form_answers fa ON fa.answer_id = an.id
            LEFT JOIN forms f ON f.id = fa.form_id AND f.user_id = :user_id
            WHERE ia.assessment_id = :assessment_id
            ORDER BY ia.id, q.id, a.id";
            $stmt = $this->db->prepare($sql);
            $result = $stmt->execute(["user_id"=>$_SESSION['user_id'], "assessment_id"=>$assessment_id]);

            // create assessment
            $assessment;
            $interest_area = new InterestAreaObject(array());
            $question = new QuestionObject(array());
            while($row = $stmt->fetch()) {
                if(!$assessment) {
                    $assessment = new AssessmentObject($row);
                }

                // create new interest area
                if($interest_area->getId() != $row['interest_area_id']) {
                    $interest_area = new InterestAreaObject($row);
                    $assessment->addInterestArea($interest_area);
                }

                // create new question
                if($question->getId() != $row['question_id']) {
                    $question = new QuestionObject($row);
                    $interest_area->addQuestion($question);
                }

                // create answer
                $answer = new AnswerObject($row);
                $question->addAnswer($answer);
            }

            return $assessment;
        }
    }

?>
