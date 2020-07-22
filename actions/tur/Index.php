<?php
namespace app\actions\tur;

use app\models\Country;
use app\models\Tur;
use yii\base\Action;
use app\models\SubscribeForm;

class Index extends Action
{
    public function run(){

        $model = new SubscribeForm();
        $hotOffers = $this->getHotOffers();

        return $this->controller->render('index',
            [
                'hotOffers' => $hotOffers,
                'modelSubscribe'=> $model
            ]
        );
    }

    public function getHotOffers(){

        return Tur::find()->select([
                Tur::tableName() . '.*',
                Country::tableName() .'.id',
                'MAX(' . Tur::tableName() . '.sell)'
            ])
            ->joinWith(['hotel.country'])
            ->joinWith(['hotel.images'])
            ->where(['IS NOT', Tur::tableName() . '.sell', null])
            ->groupBy([Tur::tableName() .'.id', Country::tableName() .'.id',])
            ->asArray()
            ->all();

    }

}