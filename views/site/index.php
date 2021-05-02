<?php

/* @var $this yii\web\View */

use yii\helpers\Html;
use yii\helpers\Url;

$this->title = $campaign->name;
?>
<style>
.campaign-wrap .ikea-image {
    background: url('<?= Url::to('@web/' . $campaign->image) ?>') no-repeat center center; 
    background-size: cover;
}    
</style>

<div class="row-fluid">
    <div class="ikea-image bg-blue col-sm-8 col-xs-12">
        
    </div>
    <div class="ikea-data bg-blue col-sm-4 col-xs-12">
        <div class="row-fluid logo text-left bg-blue">
            <?= Html::img('@web/' . $campaign->logo, ['width' => '220', 'height' => '90']) ?>
        </div>
        
        <div class="ikea-form row-fluid">
            <?= $contactForm ?>
        </div>
    </div>
</div>

