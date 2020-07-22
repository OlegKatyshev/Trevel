<?php
namespace app\models;

use yii\db\ActiveRecord;

class Hotel extends ActiveRecord
{

    public function rules()
    {
        return [
            [['name','id_country','id_city','street','home','phone','stars'], 'required'],
            [['id_country','id_city', 'home','line','stars'], 'integer'],
            [['name','street','phone' ], 'trim'],
            [['gym', 'spool', 'parking', 'beach'],'boolean', 'trueValue' => true, 'falseValue' => false, 'strict' => true],
        ];
    }

    public static function tableName()
    {
        return 'hotel';
    }

    public function getCity()
    {
        return $this->hasOne(City::class, ['id' => 'id_city']);
    }

    public function getCountry()
    {
        return $this->hasOne(Country::class, ['id' => 'id_country']);
    }

    public function getImages()
    {
        return $this->hasMany(Image::class, ['id_hotel' => 'id']);
    }

    public function getTours()
    {
        return $this->hasMany(Tur::class, ['id_hotel' => 'id']);
    }
}