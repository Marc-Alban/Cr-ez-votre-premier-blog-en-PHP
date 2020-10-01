<?php

declare(strict_types=1);

namespace App\Controller\Backoffice;

use App\Model\Manager\DashboardManager;
use App\Service\Http\Session;
use App\Service\Security\Token;
use App\View\View;
use App\Controller\ErrorController;

final class DashboardController
{
    private DashboardManager $dashboardManager;
    private View $view;
    private Token $token;
    private ErrorController $error;
    private Session $session;

    public function __construct(array $classController)
    {
        // Dépendances
        $this->dashboardManager = $classController['manager']['managerPage'] ?? null;
        $this->view = $classController['view'] ?? null; 
        $this->error = $classController['error'];
        $this->token = $classController['token'];
        $this->session = $classController['session'];
    }

    public function DashboardAction(array $datas): void
    {
        $userSession = $datas['session']['user'] ?? null;
        $user = null;

        if(!isset($userSession) && $userSession === null){
            header('Location: /?page=connexion');
            exit();
        }

        if (isset($data['get']['action']) && $data['get']['action'] === 'sendDatasUser') {
            $this->session->setParamSession('token', $this->token->createSessionToken());
            //$user = $this->dashboardManager->getDataUser($data);
        }else if(isset($data['get']['action']) && $data['get']['action'] !== 'sendDatasUser' && empty($data['get']['action'])){
            $this->error->ErrorAction();
        }

        $this->view->render('backoffice', 'dashboard', ['user' => $user]);
    }

}