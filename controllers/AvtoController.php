<?php

namespace app\controllers;
use yii\web\Controller;

class AvtoController extends Controller
{
    public function actionIndex(){
        return $this->renderPartial('index');
    }
}