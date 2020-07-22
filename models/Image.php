<?php
namespace app\models;

use yii\db\ActiveRecord;

class Image extends ActiveRecord
{
    public function rules()
    {
        return [
            [['name','id_hotel'], 'required'],
            ['id_hotel', 'integer'],
            ['name', 'trim'],
        ];
    }

    public static function tableName()
    {
        return 'image';
    }

}