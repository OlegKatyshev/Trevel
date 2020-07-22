<?php
namespace app\assets\react;

use yii\web\AssetBundle;

class TourAsset extends AssetBundle
{

    public $sourcePath = '@app/react_app/dist';

    public $css = [
       'main.bundle.css'
    ];
    public $js = [
        'vendors~main.bundle.js',
        'main.bundle.js',
    ];
    public $depends = [

    ];
}