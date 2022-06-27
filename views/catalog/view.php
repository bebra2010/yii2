<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Product */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Каталог', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="product-view">

    <h1><?= Html::encode($this->title) ?></h1>
    <?= Html::img("@web/img/{$model->img}", ['class' => 'class-img', 'alt' => "image_one"]) ?>
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'title',
            'price',
            'country',
            'year',
            'model',
            'count',
        ],
    ])?>

    <div>
        <?= 
            !Yii::$app->user->isGuest && !Yii::$app->user->identity->isAdmin ? 
                Html::a('В корзину', ['card/add', 'id' => $model -> id], ['class' => 'btn btn-success']) : ''
        ?>
    </div>




<?= Html::a('Перейти в каталог', ['index', 'id' => $id], ['class' => 'btn btn-primary']) ?>
</div>
