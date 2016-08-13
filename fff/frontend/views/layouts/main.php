<?php
use yii\helpers\Html;
use yii\jui\AutoComplete;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use frontend\assets\AppAsset;
use frontend\widgets\Alert;
use yii\bootstrap\Carousel;
use common\models\Post;
use yii\db\Connection;


/* @var $this \yii\web\View */
/* @var $content string */

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
    <?php $this->beginBody() ?>
    <div class="wrap">
        <?php
            NavBar::begin([
                'brandLabel' => 'OLEK',
                'brandUrl' => Yii::$app->homeUrl,
                'options' => [
                    'class' => 'navbar-inverse navbar-fixed-top',
                ],
            ]);
            $menuItems = [
                ['label' => 'OLEK', 'url' => ['/post/index']],
                //['label' => 'Об мне', 'url' => ['/site/about']],
               // ['label' => 'Контакты', 'url' => ['/site/contact']],
            ];
            if (Yii::$app->user->isGuest) {
                $menuItems[] = ['label' => 'Регистрация', 'url' => ['/site/signup']];
                $menuItems[] = ['label' => 'Вход', 'url' => ['/site/login']];
            } else {
                $menuItems[] = [
                    'label' => 'Выход (' . Yii::$app->user->identity->username . ')',
                    'url' => ['/site/logout'],
                    'linkOptions' => ['data-method' => 'post']
                ];
                $menuItems[] = [
                    'label' => 'Панель управления',
                    'url' => ['/admin/site']
                ];
            }
            echo Nav::widget([
                'options' => ['class' => 'navbar-nav navbar-right'],
                'items' => $menuItems,
            ]);
            NavBar::end();
        ?>

        <div class="row">
            <?
            echo Carousel::widget([
            'items' => [
            // the item contains only the image
            '<img src="http://twitter.github.io/bootstrap/assets/img/bootstrap-mdo-sfmoma-01.jpg"/>',
            // equivalent to the above
            ['content' => '<img src="http://twitter.github.io/bootstrap/assets/img/bootstrap-mdo-sfmoma-02.jpg"/>'],
            // the item contains both the image and the caption
            [
            'content' => '<img src="http://twitter.github.io/bootstrap/assets/img/bootstrap-mdo-sfmoma-03.jpg"/>',
            'caption' => '<h4>This is title</h4><p>This is the caption text</p>',

            ],
            ]
            ]);
            ?>

        </div>


        <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
        <?= Alert::widget() ?>
        <?= $content ?>
        </div>
    </div>

    <footer class="footer">
        <div class="container">
        <p class="pull-left">&copy; Olek <?= date('Y') ?></p>
        <p class="pull-right"><?= Yii::powered() ?></p>
        </div>
    </footer>

    <?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
