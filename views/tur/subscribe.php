<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
?>

<div class="subscribe-grid">
    <div class="subscribe-container">
        <h3 class="subscribe-head">
            Будь в курсе самых <span>горячих</span> предложений
        </h3>
        <?php
            $form = ActiveForm::begin([
                'options' => ['class' => 'subscribe-form'],
                'fieldConfig'=>[
                    'template'=> "{label}\n{input}\n{hint}\n{error}",
                ]
                ]);
                echo $form->field($modelSubscribe, 'mail')->input('text',['class' => 'inp-subscribe','placeholder'=>'Укажите ваш E-mail'])->label(false);
                echo Html::submitButton('Подписаться', ['class' => 'btn-subscribe']);
            ActiveForm::end();
        ?>
    </div>
</div>
