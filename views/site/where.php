<?php
use yii\helpers\Html;
$this->title = 'Где нас найти?';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-where">
    <h1><?= Html::encode($this->title) ?></h1>
</div>
<p>
8(900)123-45-67, г.Санкт-Петербург, ул.Малая морская, д.98 лит К, printer@lucshe.net
<?= Html::img('@web/img/123.PNG', ['alt' => 'Карта']) ?>
</p>
