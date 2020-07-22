<?php
namespace app\controllers;
use yii\web\Controller;

class QuizController extends Controller
{
    public function actionIndex(){

       return $this->renderPartial('index');
    }
}