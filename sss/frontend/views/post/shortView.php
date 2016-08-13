<?php
/**
 * Created by PhpStorm.
 * User: georgy
 * Date: 09.07.14
 * Time: 9:26
 */
use common\models\TagPost;
use yii\helpers\Html;

/* @var $model common\models\Post */
/* @var TagPost $postTag */
?>

<h1><?= $model->title ?></h1>

<?= Html::a('Читать далее', ['post/view', 'id' => $model->id], ['class' => 'btn btn-success']) ?>
