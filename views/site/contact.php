<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model app\models\ContactForm */


use app\widgets\youtubePlayer\YoutubePlayerWidget;

$this->title = $campaign->name;

?>

<?= YoutubePlayerWidget::widget([
    'playButtonId' => 'youtube-player-button',
    'videoId' => $campaign->youtube_video_id
    ]) ?>

<div class="header header-v2">
    <div class="logo-v2">
        <a href="#"><img src="images/logo-v2.png" alt="Logo"></a>
    </div>
</div>

<div class="banner banner-v2">
    <img class="banner-desktop" src="<?= $campaign->image ?>" alt="Banner">
    <img class="banner-mobile" src="<?= $campaign->mobile_image ?>" alt="Banner">
    <div class="container">
        <div class="inner-banner">
            <?= $campaign->campaign ?>
        </div>
    </div>
</div>

<div class="video-yotube">
    <div class="container">
        <div class="inner-video-yotube">
            <img src="https://img.youtube.com/vi/<?= $campaign->youtube_video_id ?>/sddefault.jpg" alt="youtube">
            <a href="#" id='youtube-player-button' class="btn-video"><img src="images/icon-youtube.png" alt="Play"></a>
        </div>
    </div>
</div>

<div class="main-content job-page">
    <div class="container">
        <div class="box-presonal job-page elbit-form search-page">
            <form>
                <table id="job-results">
                    <?= $this->render('_resultsHeader') ?>
                    <?php foreach($jobs as $job) : ?>
                        <?= $this->render('_resultsJob', ['job' => $job]) ?>
                    <?php endforeach; ?>
                    <?= $this->render('_activeShow') ?>
                </table>
            </form>
            <div class="step-next pagenavis">
                <a href="#" class="back-step">הגש/י קורות חיים למאגר הכללי ></a>
                <a href="#" class="back-step back-stepv2">הגש/י קורות חיים למשרות המסומנות > </a>
            </div>
        </div>
    </div>
</div>
<div class="section-client">
    <div class="container">
        <div class="slider-client">
            <div class="arrows-slider">
                <span class="btn-arrows next"><i class="fa fa-angle-right" aria-hidden="true"></i></span>
                <span class="btn-arrows prev"><i class="fa fa-angle-left" aria-hidden="true"></i></span>
            </div>
            <div class="item-client">
                <div class="inner-item-client">
                    <div class="right-client">
                        <a href="#"><img src="images/client-img.png" alt="Client"></a>
                    </div>
                    <div class="left-client">
                        <h3><a href="">ליה אורגד</a></h3>
                        <span>ראש מינהל אבטחת איכות</span>
                        <p>"לורם איפסום דולור סיט אמט, קונסקטורר אדיפיסינג אלית לפרומי בלוף קינץ תתיח לרעח. לת צשחמי צש בליא, מנסוטו צמלח לביקו ננב" מוקו בלוקריה שיצמה ברורק. ליבם סולגק. בראיט ולחת צורק מונחף, בגורמי מגמש. תרבנך וסתעד לכנו סתשם השמה - לתכי מורגם בורק? לתיג ישבעס. לורם איפסום דולור סיט אמט, קונסקטורר אדיפיסינג אלית לפרומי בלוף קינץ תתיח לרעח. לת צשחמי צש בליא, מנסוטו צמלח לביקו ננב" מוקו בלוקריה שיצמה ברורק. ליבם סולגק. בראיט ולחת צורק מונחף, בגורמי מגמש. תרבנך וסתעד לכנו סתשם השמה - לתכי מורגם בורק? לתיג ישבעס."</p>
                    </div>
                </div>
            </div>
            <div class="dots-slider">
                <div class="inner-arrows-slider">
                    <span class="btn-dots active"></span>
                    <span class="btn-dots"></span>
                    <span class="btn-dots"></span>
                    <span class="btn-dots"></span>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="info-footer job-v2">
    <div class="container">
        <div class="social-header">
            <span>עקבו אחרינו במדיה החברתית:</span>
            <ul>
                <li><a aria-label="facebook" href="#"><i class="fa fa-facebook-official" aria-hidden="true"></i></a></li>
                <li><a aria-label="linkedin" href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
            </ul>
        </div>
        <div class="info-email">
            <p>ליצירת קשר עם צוות הגיוס : &nbsp;&nbsp;<a href="mailto:Recruitment@elbitsystems.com">Recruitment@elbitsystems.com</a></p>
        </div>
        <a class="link-page" href="https://elbitsystems.com"> למעבר לאתר אלביט &gt;</a>
    </div>
    <a href="#" class="back-top-top">Up<i class="fa fa-long-arrow-up" aria-hidden="true"></i></a>
</div>