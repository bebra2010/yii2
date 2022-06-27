<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\widgets\ListView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\ProductSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->registerCssFile('@web/css/catalog.css');

$this->title = 'Каталог';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="product-index" id="pjax-block">

    <h1><?= Html::encode($this->title) ?></h1>

    <?php Pjax::begin([
        'enablePushState' => false, 
        'timeout' => 5000,
        'id'=>'pjaxcatalog',
    ]); ?>

    <?php echo $this->render('_search', ['model' => $searchModel,
    'categories' => $categories,
    'dataProvider' => $dataProvider,
    ]); 
    ?>

    <?= ListView::widget([
        'dataProvider' => $dataProvider,
        'itemOptions' => ['class' => 'item'],
        'layout' => '{pager}<div class="row">{items}</div>{pager}',
        'pager' => ['class' => \yii\bootstrap4\LinkPager::class],
        'itemView' => function ($model, $key, $index, $widget) {
            $stringcard = "<div class=\"card\" style=\"width: 18rem;\">"
            . Html::a(Html::img("@web/img/{$model->img}", ['class' => 'class-img', 'alt' => "..."]), 
            ['view', 'id' => $model -> id]) 
            . "<div class=\"card-body\">"
            . Html::a(Html::encode($model->title), ['view', 'id' => $model -> id])
            . "<p class=\"card-text\">{$model->price} рублей</p>"
            . "</div>"
            . ( !Yii::$app->user->isGuest && !Yii::$app->user->identity->isAdmin ? 
            Html::a('В корзину', ['card/add', 'id' => $model -> id], ['class' => 'btn btn-success']) : '')
            . "</div>";
            return $stringcard;
        },
    ]) ?>

    <?php Pjax::end(); ?>

</div>
