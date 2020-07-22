<?php
use yii\helpers\Html;
use app\assets\MainAsset;

MainAsset::register($this);
?>

<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?php $this->registerCsrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>

<header class="header">
    <div class="header-grid">
        <div class="container">
            <div class="phone">
                <?= Html::img('@web/image/phone.png', ['alt' => 'Наш логотип', 'class'=>'phone-img']) ?>
                <span>7(977)968-88-77</span>
            </div>
            <div class="social">
                <ul>
                    <li class="social-icon">
                        <i class="fab fa-youtube-square"></i>
                    </li>
                    <li class="social-icon">
                        <i class="fab fa-vk"></i>
                    </li>
                    <li class="social-icon">
                        <i class="fab fa-facebook"></i>
                    </li>
                    <li class="social-icon">
                        <i class="fab fa-telegram"></i>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="menu-f">
        <video autoplay="" loop="" muted="">
            <source src="/video/beach1.mp4" type="video/mp4">
        </video>
        <div class="menu-grid">
            <div class="menu">
                <?= Html::img('@web/image/logo.png', ['alt' => 'Наш логотип', 'class'=>'logo']) ?>
                <h2 class="head">World</h2>
                <ul>
                    <li><?php echo Html::a('Туры', ['tur/index']) ?> </li>
                    <li><?php echo Html::a('Аренда авто', ['avto/index']) ?></li>
                    <li><?php echo Html::a('Опрос/Отзыв', ['quiz/index']) ?></li>
                </ul>
            </div>
        </div>
    </div>
</header>

<?php echo  $content; ?>

<footer class="footer-grid">
    <div class="container">
        <?= Html::img('@web/image/logo.png', ['alt' => 'Наш логотип', 'class'=>'logo']) ?>
        <h2 class="head">World</h2>
        <div class="adress">
            <p><span>Город: </span> Москва</p>
            <p><span>ул: </span>Маросейка д 12</p>
            <p><span>Email: </span>TravelWord@mail.ru</p>
            <p><span>Тел: </span>7(977)968-88-77</p>
        </div>
    </div>
</footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>