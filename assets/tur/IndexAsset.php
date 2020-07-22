<?php

namespace app\assets\tur;

use yii\web\AssetBundle;


class IndexAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'css/tur/index.css',
        'css/tur/rent-car.css',
        'css/tur/hot-offer.css',
        'css/tur/subscribe.css'
    ];
    public $js = [
         'js/tur/hot-offer-slider.js',
    ];
    public $depends = [
        'app\assets\MainAsset',
    ];
}