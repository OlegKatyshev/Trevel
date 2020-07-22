<?php
namespace app\models;

use yii\base\Model;

class SendForm extends Model
{
    public $phone;

    public $email;

    public $name;


    public function rules()
    {
        return [
            ['email', 'email','message' => 'E-mail указан некорректно'],
            [['name', 'phone', 'email'], 'trim'],
            ['phone', 'required', 'message' => 'Укажите телефон'],
            ['email', 'required', 'message' => 'Укажите E-mail'],
            ['phone', 'match', 'pattern' => '~^\d{10}$~','message' => 'Укажите 10 цифр телефона (без 8)'],
        ];
    }
}