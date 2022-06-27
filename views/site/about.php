<?php

/** @var yii\web\View $this */

use yii\helpers\Html;
use yii\bootstrap4\Carousel;

$this->title = 'О нас';
$this->params['breadcrumbs'][] = $this->title;
$this->registerCssFile('@web/css/about.css');
?>

<div class="site-about">
    <h1><?= Html::encode($this->title) ?></h1>

    <p id="description">Компания «Copy Star» занимается обслуживанием физических и юридических лиц и дает возможность 
    приобретать любой товар в любом количестве из всего огромного ассортимента, представленного на сайте компании. 
    Индивидуальный подход к каждому клиенту и выделение персонального менеджера по продажам позволяет подобрать наиболее 
    эффективное решение и обеспечить достойный сервис, отвечающий всем пожеланиям.
    </p>

    <h2 id="deviz">Пока принтер печатает — вы отдыхаете!<h2>

    

    <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <?php foreach($result as $key => $r): ?>
            <?php $active = !$key ? "active" : "" ?>   
            <div class="carousel-item <?=$active?>">    

            <h5 class="carousel-text"><?= $r['title'] ?></h5>
            <!--<div class="carousel-caption d-none d-md-block">   
            </div>-->
            
            <?= Html::img("@web/img/{$r['img']}", ['alt' => 'Картинка', 'class' => "d-block w-100 img-item"]) ?>
            
            </div>       
            <?php endforeach ?>

    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Предыдущий</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Следующий</span>
    </a>
    </div

</div>
