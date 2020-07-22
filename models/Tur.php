<?php

namespace app\models;

use yii\db\ActiveRecord;

class Tur extends ActiveRecord
{

    public function rules()
    {
        return [
            [['id_hotel','price','date_s','date_e','food'], 'required'],
            [['id_hotel','sell','price'], 'integer'],
            ['food', 'trim'],
            [['date_s','date_e',],'date'],
            ['transfer','boolean', 'trueValue' => true, 'falseValue' => false, 'strict' => true]
        ];
    }

    public static function tableName()
    {
        return 'tur';
    }

    public function getHotel()
    {
        return $this->hasOne(Hotel::class, ['id' => 'id_hotel']);
    }
}