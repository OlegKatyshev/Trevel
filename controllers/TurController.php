<?php
namespace app\controllers;

use yii\web\Controller;
use app\models\Country;
use app\models\SendForm;

class TurController extends Controller
{

    public function actions()
    {
        return [
            'index' => [
                'class' => 'app\actions\tur\Index',
            ],
            'tours' => [
                'class' => 'app\actions\tur\Tours',
            ],
        ];
    }

    public function beforeAction($action)
    {
        if (in_array($action->id, ['tours','send'])) {
            $this->enableCsrfValidation = false;
        }
        return parent::beforeAction($action);
    }

    public function actionCountries(){
        $data = Country::find()->select(['id','name'])->orderBy('id')->asArray()->all();
        array_unshift($data,[ 'id'=> 0, 'name'=> '' ]);
        return json_encode($data);
    }

    public function actionSend(){

       if(\Yii::$app->request->isPost){

           $model = new SendForm();
           $model->setAttributes(\Yii::$app->request->post());
           if($model->validate()) {

               return json_encode([
                   'status' => 1,
                   'message' => 'Спасибо что выбрали нас! Менеджер с вами свяжется в течении 10 минут',
                   'errors' => []
               ]);
           }
           else{
               return json_encode([
                      'status' => null,
                      'message' => '',
                      'errors' => $model->getErrors()
               ]);
           }
       }
        return json_encode([
            'status' => 2,
            'message' => 'Ошибка при отправке данных, попробуйте позже.',
            'errors' => []
        ]);

    }

}
