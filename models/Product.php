<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "product".
 *
 * @property int $id
 * @property string $title
 * @property string $img
 * @property int $price
 * @property string $country
 * @property int $year
 * @property string $model
 * @property int $count
 * @property int $id_category
 *
 * @property Category $category
 * @property OrderStructure[] $orderStructures
 */
class Product extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['title', 'img', 'price', 'country', 'year', 'model', 'count', 'id_category'], 'required'],
            [['price', 'year', 'count', 'id_category'], 'integer'],
            [['title', 'img', 'country', 'model'], 'string', 'max' => 255],
            [['id_category'], 'exist', 'skipOnError' => true, 'targetClass' => Category::className(), 'targetAttribute' => ['id_category' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Наименование',
            'img' => 'Изображение',
            'price' => 'Цена',
            'country' => 'Страна',
            'year' => 'Год выпуска',
            'model' => 'Модель',
            'count' => 'Количество',
            'id_category' => 'Id Категории',
        ];
    }

    /**
     * Gets query for [[Category]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCategory()
    {
        return $this->hasOne(Category::className(), ['id' => 'id_category']);
    }

    /**
     * Gets query for [[OrderStructures]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrderStructures()
    {
        return $this->hasMany(OrderStructure::className(), ['id_product' => 'id']);
    }

    public static function getImages()
    {
        return (new \yii\db\Query())
                            ->select(['img','title'])
                            ->from('product')
                            ->orderBy('id DESC')
                            ->limit(5)
                            ->all()
                            ;
    }
}
