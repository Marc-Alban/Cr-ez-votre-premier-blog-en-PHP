<?php
declare(strict_types=1);
namespace App\Model\Manager;

use App\Model\Repository\CommentRepository;
use App\Service\Http\Request;
use App\Service\Http\Session;
use App\Service\Security\Token;

final class CommentManager
{
    private CommentRepository $commentRepository;
    private $errors = null;
    private $success = null;
    public function __construct(CommentRepository $commentRepository)
    {
        $this->commentRepository = $commentRepository;
    }
    /**
     * Comment validation method
     *
     * @param integer $idComment
     * @return array|null
     */
    public function valideComment(int $idComment): ?array
    {
        $valComment = $this->commentRepository->valide($idComment);
        if ($valComment === true) {
            $this->success['sendValide'] = "Commentaire validé";
            return $this->success;
        }
        return null;
    }
    /**
     * Comment delete method
     *
     * @param integer $idComment
     * @return array|null
     */
    public function deleteComment(int $idComment): ?array
    {
        $delComment = $this->commentRepository->delete($idComment);
        if ($delComment === true) {
            $this->errors['sendDelete'] = "Commentaire supprimé";
            return $this->errors;
        }
        return null;
    }
    /**
     * Get All Comments
     *
     * @return array|null
     */
    public function findAllComments(): ?array
    {
        return $this->commentRepository->findAll();
    }
    /**
     * Get comment with the post id
     *
     * @param integer $postId
     * @return array|null
     */
    public function findCommentByPostId(int $postId): ?array
    {
        return  $this->commentRepository->findByPostId($postId);
    }
    /**
     * Checking the comment form and returning an error or not if the form is bad
     *
     * @param integer $idComment
     * @param integer $idUser
     * @param Request $request
     * @param Session $session
     * @param Token $token
     * @return array|null
     */
    public function checkComment(int $idComment, int $idUser, Request $request, Session $session, Token $token): ?array
    {
        $post = $request->getPost() ?? null;
        $comment = $post->get('comment');
        if (empty($comment)) {
            $this->errors["error"]['messageEmpty'] = "Veuillez mettre un commentaire";
        }
        if ($token->compareTokens($session->getSessionName('token'), $post->get('token')) !== false) {
            $this->errors['error']['formRegister'] = "Formulaire incorrect";
        }
        if (empty($this->errors)) {
            $this->success["success"]['send'] = 'Votre commentaire est en attente de validation';
            $this->commentRepository->create($comment, $idUser, $idComment);
            return $this->success;
        }
        return $this->errors;
    }
}
