<?php


    use \Psr\Http\Message\ServerRequestInterface as Request;
    use \Psr\Http\Message\ResponseInterface as Response;

    session_start();

    require __DIR__ .'/../vendor/autoload.php';

    //$config['displayErrorDetails'] = true; // for development

    $config['db']['host']   = "127.0.0.1";
    $config['db']['user']   = "appUser";
    $config['db']['pass']   = 'Pa$$word';
    $config['db']['dbname'] = "hiring_project";

    $app = new \Slim\App(["settings" => $config]);
    $container = $app->getContainer();

    $container['view'] = new \Slim\Views\PhpRenderer("../templates/");

    $container['db'] = function ($c) {
        $db = $c['settings']['db'];
        $pdo = new PDO("mysql:host=". $db['host'] .";dbname=". $db['dbname'], $db['user'], $db['pass']);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
        return $pdo;
    };

    $container['flash'] = function () {
        return new \Slim\Flash\Messages();
    };

    // middleware to make sure user is logged in
    $app->add(function($request, $response, $next) {
        if(!$_SESSION['isLoggedIn'] && $request->getUri()->getPath() != '/login') {
            $path = $this->get('router')->pathFor('login');
            $response = $response->withStatus(302)->withHeader('Location', $path);
        }

        $response = $next($request, $response);
        return $response;
    });

    $app->get('/', function ($request, $response, $next) {
        $path = $this->get('router')->pathFor('home');
        return $response->withStatus(302)->withHeader('Location', $path);
    });


    $app->get('/login', function (Request $request, Response $response, array $args) {
        // Get flash messages from previous request
        $error_message = $this->flash->getMessages()['Error'][0];

        // pass username if redirected back
        $username = $request->getParam('username');
        return $this->view->render($response, "login.phtml", ['username'=>$username, 'error_message'=>$error_message]);
    })->setName('login');

    // authenticate login
    $app->post('/login', function (Request $request, Response $response, array $args) {
        // check if user is already logged in
        $username = $request->getParam('username');
        $password = $request->getParam('password');

        // get password from database for user
        $sql = "SELECT id, password
        FROM users
        WHERE username = ?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute(array($username));
        $row = $stmt->fetch();
        $storedPassword = $row['password'];

        if(password_verify(base64_encode(hash('sha256', $password, true)), $storedPassword)) {
            // Successful
            $_SESSION['isLoggedIn'] = true;
            $_SESSION['user_id'] = $row['id'];
            print 'ehre';
            $path = $this->get('router')->pathFor('home');
            $response = $response->withStatus(302)->withHeader('Location', $path);
        }
        else {
            // Failured
            $this->flash->addMessage('Error', 'Invalid Username or Password.');
            $path = $this->get('router')->pathFor('login',[], ['username'=>$username]);
            $response = $response->withStatus(302)->withHeader('Location', $path);
        }

        return $response;
    });

    $app->get('/logout', function (Request $request, Response $response, array $args) {
        // Unset all of the session variables.
        $_SESSION = array();

        // Delete the session cookie.
        if(ini_get("session.use_cookies")) {
            $params = session_get_cookie_params();
            setcookie(session_name(), '', time() - 42000,
                $params["path"], $params["domain"],
                $params["secure"], $params["httponly"]
            );
        }

        // Destroy the session.
        session_destroy();

        $path = $this->get('router')->pathFor('login');
        return $response->withStatus(302)->withHeader('Location', $path);
    })->setName('logout');


    $app->get('/home', function (Request $request, Response $response, array $args) {
        //$this->logger->addInfo("Ticket list");
        $mapper = new AssessmentMapper($this->db);
        $assessments = $mapper->getAssessments();
        $response = $this->view->render($response, "home.phtml", ["assessments" => $assessments, "router" => $this->get('router')]);
        //$response = $this->view->render($response, "home.phtml");

        return $response;

    })->setName('home');

    $app->get('/assessment/{assessment_id:[1-9]+}/{page:[1-9]+}', function (Request $request, Response $response, array $args) {
        // get interest area with questions and answers
        $pdo = $this->db;
        $assessment_id = $args['assessment_id'];
        $page = $args['page'];

        if($request->getParam('reset')) {
            //delete answers
            $sql = "DELETE FROM form_answers
            WHERE form_id IN (SELECT id FROM forms WHERE user_id = :user_id AND assessment_id = :assessment_id)";
            $stmt = $this->db->prepare($sql);
            $result = $stmt->execute(['user_id'=>$_SESSION['user_id'], 'assessment_id'=>$assessment_id]);

            //delete form and answers
            $sql = "DELETE FROM forms
            WHERE user_id = :user_id AND assessment_id = :assessment_id";
            $stmt = $this->db->prepare($sql);
            $result = $stmt->execute(['user_id'=>$_SESSION['user_id'], 'assessment_id'=>$assessment_id]);
        }

        // set on_page
        $sql = "UPDATE forms SET on_page = :page
        WHERE user_id = :user_id AND assessment_id = :assessment_id";
        $stmt = $this->db->prepare($sql);
        $result = $stmt->execute(['page'=>$page, 'user_id'=>$_SESSION['user_id'], 'assessment_id'=>$assessment_id]);

        $mapper = new InterestAreaMapper($pdo);
        $interestArea = $mapper->getInterestAreaByPage($assessment_id, $page);

        // get # of interest_areas for this assessment
        $sql = "SELECT COUNT(id) AS num_interest_areas
        FROM interest_areas
        WHERE assessment_id = :assessment_id";
        $stmt = $this->db->prepare($sql);
        $result = $stmt->execute(['assessment_id'=>$assessment_id]);
        $row = $stmt->fetch();
        $num_interest_areas = $row['num_interest_areas'];

        $response = $this->view->render($response, "assessment.phtml", ["interestArea" => $interestArea, "router" => $this->get('router'), "current_page"=>$page, "num_interest_areas"=>$num_interest_areas]);

        return $response;
    })->setName('assessment');

    $app->post('/assessment/{assessment_id:[1-9]+}/{page:[1-9]+}', function (Request $request, Response $response, array $args) {
        // get interest area with questions and answers
        $pdo = $this->db;
        $assessment_id = $args['assessment_id'];
        $page = $args['page'];
        $mapper = new InterestAreaMapper($pdo);
        $interestArea = $mapper->getInterestAreaByPage($assessment_id, $page);

        // get form id
        $sql = "SELECT id
        FROM forms
        WHERE user_id = :user_id AND assessment_id = :assessment_id";
        $stmt = $this->db->prepare($sql);
        $result = $stmt->execute(['user_id'=>$_SESSION['user_id'], 'assessment_id'=>$assessment_id]);
        $row = $stmt->fetch();
        $form_id = $row['id'];
        if(!$form_id) {
            // create new form
            $sql = "INSERT INTO forms
            (user_id, assessment_id) VALUES
            (:user_id, :assessment_id)";
            $stmt = $this->db->prepare($sql);
            $result = $stmt->execute(["user_id" => $_SESSION['user_id'], "assessment_id" => $assessment_id]);
            $form_id = $pdo->lastInsertId();
        }
        $data = $request->getParsedBody();
        $mapper->save($interestArea, $form_id, $data);

        // go to next page
        if($request->getParam('back')) { $page--; }
        else { $page++; }

        // get # of interest_areas for this assessment
        $sql = "SELECT COUNT(id) AS num_interest_areas
        FROM interest_areas
        WHERE assessment_id = :assessment_id";
        $stmt = $this->db->prepare($sql);
        $result = $stmt->execute(['assessment_id'=>$assessment_id]);
        $row = $stmt->fetch();
        $num_interest_areas = $row['num_interest_areas'];

        if($page > $num_interest_areas) {
            // set form to submitted
            $sql = "UPDATE forms SET submitted = 1
            WHERE user_id = :user_id AND assessment_id = :assessment_id";
            $stmt = $this->db->prepare($sql);
            $result = $stmt->execute(['user_id'=>$_SESSION['user_id'], 'assessment_id'=>$assessment_id]);

            $path = $this->get('router')->pathFor('review', ['assessment_id'=>$assessment_id]);
        } else {
            $path = $this->get('router')->pathFor('assessment', ['assessment_id'=>$assessment_id, 'page'=>$page]);
        }

        return $response->withStatus(302)->withHeader('Location', $path);
    });

    $app->get('/review/{assessment_id:[1-9]+}', function (Request $request, Response $response, array $args) {
        $assessment_id = $args['assessment_id'];

        $mapper = new AssessmentMapper($this->db);
        $assessment = $mapper->getAssessementById($assessment_id);

        $response = $this->view->render($response, "review.phtml", ["assessment" => $assessment, "router" => $this->get('router'), "current_page"=>$page]);

        return $response;
    })->setName('review');


    $app->run();
?>
