<?php
use app\assets\tur\IndexAsset;
use app\assets\react\TourAsset;

IndexAsset::register($this);
TourAsset::register($this);
?>
<div class="search-grid">
    <div id="app" class="react-app"></div>
</div>
<?php
echo $this->render('hot-offer',[ 'hotOffers' => $hotOffers ]);
echo $this->render('subscribe',[ 'modelSubscribe' => $modelSubscribe ]);
echo $this->render('rent-car');

?>
