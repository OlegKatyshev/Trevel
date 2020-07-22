<?php
namespace app\models;

use yii\db\ActiveRecord;

class Country extends ActiveRecord
{

    public function rules()
    {
        return [
            ['name', 'required'],
            ['name', 'trim'],
        ];
    }

    public static function tableName()
    {
        return 'country';
    }

    public function getCities()
    {
        return $this->hasMany(City::class, ['id_country' => 'id']);
    }

    public function getHotels()
    {
        return $this->hasMany(Hotel::class, ['id_country' => 'id']);
    }

}