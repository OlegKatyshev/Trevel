<?php
use yii\helpers\ArrayHelper;
?>

<div class="hot-offer-grid">
   <div class="offer-container">
       <h3 class="hot-offers-head">Скидки на направления</h3>
       <div class="slider-offer" id="offer-slider">
           <div class="container-slide" id="wrap-slider">
                <?php

                    foreach($hotOffers as $offer){
                        $eng_name = ArrayHelper::getValue($offer,'hotel.country.eng_name');
                        $hotel_id = ArrayHelper::getValue($offer,'hotel.id');
                        $img_id = ArrayHelper::getValue($offer,'hotel.images.0.name') . '.jpg';
                        $name = ArrayHelper::getValue($offer,'hotel.country.name');

                        echo "<div class='offer' style='background-image: url(/image/{$eng_name}/{$hotel_id}/{$img_id})'>
                                    <span class='label-offer'>{$name}</span>
                                    <span class='label-sale'>-{$offer['max']}%</span>
                              </div>";
                    }
                ?>
           </div>
           <div id="slide-prev" class="btn-slide slide-prev"><i class="fa fa-chevron-left"></i></div>
           <div id="slide-next" class="btn-slide slide-next"><i class="fa fa-chevron-right"></i></div>
       </div>
    </div>
    <div class="fon-offer"></div>
</div>
