<?php
namespace app\assets;

use yii\web\AssetBundle;

class MainAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'css/main_layout.css',
        'fontawesome/css/all.css'
    ];

    public $js = [
    ];

    public $depends = [

    ];
}