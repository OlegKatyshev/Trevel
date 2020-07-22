<?php

namespace app\models;

use yii\base\Model;

class SubscribeForm extends Model
{
    public $mail;

    public function rules()
    {
        return [

            ['mail', 'required','message' => 'Укажите E-mail'],
            ['mail', 'email','message' => 'Некорректный E-mail'],

        ];
    }


    public function attributeLabels()
    {
        return [
            'mail' => 'E-mail',
        ];
    }

}
