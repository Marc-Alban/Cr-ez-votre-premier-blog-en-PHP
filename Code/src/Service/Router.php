<?php
declare(strict_types=1);
namespace  App\Service;
use App\Service\Database;
use App\Controller\ErrorController;
use App\Service\Security\Token;
use App\Service\Http\Session;
use App\Service\Http\Request;
use App\View\View;
final class Router
{
    private ConfigProperties $configProperties;
    private Database $database;
    private Request $request;
    private Token $token;
    private View $view;
    private ErrorController $error;
    public function __construct()
    {
        $this->request = new Request();
        $this->token = new Token();
        $this->configProperties = new ConfigProperties();
        $this->database = new Database($this->configProperties);
        $this->session = new Session();
        $this->view = new View($this->session);
        $this->error = new ErrorController($this->view);
    }
    public function run()
    {
        $this->page = $this->request->getGet()->get('page') ?? 'home';
        $pageMin = lcfirst($this->page);
        $pageFront = [
        'home' => 'UserController',
        'post' => 'PostController',
        'posts' => 'PostController',
        'connexion' => 'UserController',
        'inscription' => 'UserController',
        ];
        $pageBack = [
        'dashboard' => 'UserController',
        'allPost' => 'PostController',
        'allComments' => 'CommentController',
        'addPost' => 'PostController',
        'updatePost' => 'PostController',
        'password' => 'UserController'
        ];
        if(array_key_exists($pageMin, $pageFront)){
            $repositoryName = str_replace('Controller','Repository',$pageFront[$pageMin]);
            $managerName = str_replace('Controller','Manager',$pageFront[$pageMin]);
            $repository = 'App\Model\Repository\\' .$repositoryName;
            $manager = 'App\Model\Manager\\' .$managerName;
            switch($pageFront[$pageMin]){
                case 'UserController':
                    $userRepo = new $repository($this->database);
                    $userManager = new $manager($userRepo);
                    $controller = 'App\Controller\Frontoffice\\' .$pageFront[$pageMin];
                    $control = new $controller($userManager, $this->view, $this->error, $this->token, $this->session, $this->request);
                    $methode = $pageMin.'Action';
                    $control->$methode();
                break;
                case 'PostController':
                    $postRepo = new $repository($this->database);
                    $postManager = new $manager($postRepo);
                    $controller = 'App\Controller\Frontoffice\\' .$pageFront[$pageMin];
                    $control = new $controller($postManager, $this->view, $this->error, $this->token, $this->session);
                    $methode = $pageMin.'Action';
                    $control->$methode();
                break;
            }
        }else if(array_key_exists($pageMin, $pageBack)){
            $repositoryName = str_replace('Controller','Repository',$pageBack[$pageMin]);
            $managerName = str_replace('Controller','Manager',$pageBack[$pageMin]);
            $repository = 'App\Model\Repository\\' .$repositoryName;
            $manager = 'App\Model\Manager\\' .$managerName;
            switch($pageBack[$pageMin]){
                case 'UserController':
                    $userRepo = new $repository($this->database);
                    $userManager = new $manager($userRepo, $this->request);
                    $controller = 'App\Controller\Backoffice\\' .$pageFront[$pageMin];
                    $control = new $controller($userManager, $this->view, $this->error, $this->token, $this->session, $this->request);
                    $methode = $pageMin.'Action';
                    $control->$methode();
                break;
                case 'PostController':
                    $postRepo = new $repository($this->database);
                    $postManager = new $manager($postRepo);
                    $controller = 'App\Controller\Backoffice\\' .$pageFront[$pageMin];
                    $control = new $controller($postManager, $this->view, $this->token, $this->session);
                    $methode = $pageMin.'Action';
                    $control->$methode();
                break;
                case 'CommentController':
                    $commentRepo = new $repository($this->database);
                    $commentManager = new $manager($commentRepo);
                    $controller = 'App\Controller\Backoffice\\' .$pageFront[$pageMin];
                    $control = new $controller($commentManager,$this->view,$this->request);
                    $methode = $pageMin.'Action';
                    $control->$methode();
                break;
            }
        }else if(!array_key_exists($pageMin, $pageFront) || !array_key_exists($pageMin, $pageBack)){
            $this->error->notFound();
        }
    }
}
