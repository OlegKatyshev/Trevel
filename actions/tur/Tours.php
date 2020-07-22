<?php
namespace app\actions\tur;

use yii\base\Action;
use app\models\SearchForm;

class Tours extends Action
{
    public function run(){

        if(\Yii::$app->request->isPost){
            $model = new SearchForm();
            $model->setAttributes(\Yii::$app->request->post());
            if($model->validate()) {
                return json_encode($model->search());
            }
            else{
                return json_encode([
                    'pages' => [],
                    'data' => [],
                    'errors' => $model->getErrors()
                ]);
            }
        }
    }
}