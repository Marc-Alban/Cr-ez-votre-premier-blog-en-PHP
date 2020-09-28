<?php
declare(strict_types=1);
namespace App\Model\Manager;

use App\Model\Entity\User;
use App\Model\Repository\UserRepository;
use App\Service\Http\Session;
use App\Service\Security\Token;

class InscriptionManager
{
    private UserRepository $userRepository;
    private Token $token;
    private User $user;
    private Session $session;
    public function __construct(array $dataManager)
    {
        $this->userRepository = $dataManager['repository'];
        $this->token = $dataManager['token'];
        $this->session = $dataManager['session'];
    }

    public function userSignIn(array $data): ?array
    {


        $action = $data['get']['action'] ?? null;

        $errors = $data["session"]["errors"] ?? null;
        unset($data["session"]["errors"]);

        $succes = $data["session"]["succes"] ?? null;
        unset($data["session"]["succes"]);

        if (isset($data['post']) && $action === "inscription") {

            $pseudo = $data["post"]['userName'] ?? null;
            $email = $data["post"]['email'] ?? null;
            $password =  $data['post']['password'] ?? null;
            $passwordConfirmation = $data["post"]['passwordConfirmation'] ?? null;

            if (empty($pseudo) && empty($email) && empty($password) && empty($passwordConfirmation)) {
                $errors['error']["formEmpty"] = 'Veuillez mettre un contenu';
            } else if (empty($pseudo)) {
                $errors['error']["pseudoEmpty"] = 'Veuillez mettre un pseudo ';
            } else if (empty($email)) {
                $errors['error']["emailEmpty"] = 'Veuillez mettre un mail ';
            } else if (!preg_match(" /^.+@.+\.[a-zA-Z]{2,}$/ ", $email)) {
                $errors['error']['emailWrong'] = "L'adresse e-mail est invalide";
            }else if ($email === $this->userRepository->getEmail($this->user)) {
                $errors['error']['emailFalse'] = "L'adresse e-mail est déjà présente en bdd";
            }else if (empty($password)) {
                $errors['error']["passwordEmpty"] = 'Veuillez mettre un mot de passe';
            }else if (strlen($password) < 8 ) {
                $errors['error']["passwordlengt"] = 'Veuillez mettre un mot de passe de plus de 8 caractères';
            } else if ($password !== $passwordConfirmation) {
                $errors['error']['passwordWrong'] = 'Mot de passe et mot de passe de confirmation ne corresponde pas.. ';
            } else if (!preg_match('#^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).{6,}$#', $password)) {
                $errors['error']['passNotCorrect'] = 'Mot de passe non conforme, doit avoir minuscule-majuscule-chiffres-caractères';
            }

            /************************************Token Session************************************************* */
            if ($this->token->compareTokens($data) !== null) {
                $errors['error']['formRgister'] = "Formulaire incorrect";
            }
            /************************************End Token Session************************************************* */

            if (empty($errors)) {
                $this->session->setParamSession('user', $pseudo);
                $this->userRepository->createUser($data);
                $succes['succes']['send'] = 'Utilisateur est bien inscrit';
                return $succes;
            }
            return $errors;
        }
        return null;
    }
}