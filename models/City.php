<?php
namespace app\models;

use yii\db\ActiveRecord;

class City extends ActiveRecord
{

    public function rules()
    {
        return [
            [['name','id_country'], 'required'],
            ['id_country', 'integer'],
            ['name', 'trim'],
        ];
    }

    public static function tableName()
    {
        return 'city';
    }

    public function getCountry()
    {
        return $this->hasOne(Country::class, ['id' => 'id_country']);
    }

    public function getHotels()
    {
        return $this->hasMany(Hotel::class, ['id_city' => 'id']);
    }
}