<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model app\models\ContactForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;

$this->title = 'אגד - הגשת מועמדות';
?>

<div dir="rtl">
    <h3>קובץ קורות חיים אוטומטי - איקאה משרות</h3>
    <br>
    <h4>פרטי מועמד</h4>
    <?php foreach ($model->attributes as $name => $value) : ?>
        <?php if ($name === 'cvfile' || $name === 'supplierId' || $name === 'show_store') continue; ?>
        <?php if ($name === 'jobTitle' && $value) : ?>
            <p><span style="font-weight: bold;"><?= $model->getAttributeLabel($name) ?>: </span> <?= $model->getJobs(false)[$value] ?></p>
        <?php endif; ?>
        <p><span style="font-weight: bold;"><?= $model->getAttributeLabel($name) ?>: </span> <?= $value ?></p>
    <?php endforeach; ?>
    <p><span style="font-weight: bold;">קוד משרה: </span> <?= $model->jobCode ?></p>
</div>