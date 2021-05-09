<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;
use app\models\FbfContactForm;
use app\models\Campaign;
use app\models\Team;
use app\models\Search;
use yii\web\UploadedFile;
use app\controllers\ElbitController;

class SiteController extends ElbitController
{
    public $defaultAction = 'contact';

    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }


    /**
     * Login action.
     *
     * @return Response|string
     */
    public function actionLogin()
    {
        $this->layout = 'main_admin';
        if (!Yii::$app->user->isGuest) {
            return $this->redirect(['/campaign/index']);
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->redirect(['/campaign/index']);
        }

        $model->password = '';
        return $this->render('login', [
            'model' => $model,
        ]);
    }

    /**
     * Logout action.
     *
     * @return Response
     */
    public function actionLogout()
    {
        $this->layout = 'main_admin';
        Yii::$app->user->logout();

        return $this->redirect(['/campaign/index']);
    }

    /**
     * Displays contact page.
     *
     * @return Response|string
     */
    public function actionContact($id)
    {
        $campaign = $this->validCampaign($id);
        $supplierId = Yii::$app->request->get('sid', (empty($campaign->sid) ? Yii::$app->params['supplierId'] : $campaign->sid));
        $campaign->hits += 1;
        $campaign->save(false, ['hits']);

        $search = new Search($supplierId);
        $team = new Team();

        return $this->render('contact', [
            'campaign' => $campaign,
            'jobs' => $search->jobs(true),
            'people' => $team->find()->all(),
        ]);
    }

    private function validCampaign($id)
    {
        $campaign = Campaign::findOne($id);

        if ($campaign === null) {
            throw new \yii\web\NotFoundHttpException(Yii::t('app', 'A campaign with this ID could not be found'));
        }

        $now = time();
        if ($campaign->start_date_int > $now || (isset($campaign->end_date_int) && $campaign->end_date_int < $now)) {
            throw new \yii\web\NotFoundHttpException(Yii::t('app', 'The campaign is not active!'));
        }
        return $campaign;
    }

    public function actionApply()
    {
        $request = Yii::$app->request;
        $jobs = $request->post('jobs');
        $idnumber = $request->post('idnumber');
        $name = $request->post('name');

        if (empty($jobs)) {
            return $this->asJson(['status' => 'error', 'html' => $this->renderPartial('_errorNoJobs')]);
            Yii::$app->end();
        }

        $jobs = explode(',', $jobs);

        $campaignid = $request->post('campaignid');
        $campaign = $this->validCampaign($campaignid);

        $model = new ContactForm();
        $model->supplierId = Yii::$app->request->get('sid', (empty($campaign->sid) ? Yii::$app->params['supplierId'] : $campaign->sid));
        
        $count = 0;
        if ($model->load(Yii::$app->request->post(), '')) {
            $model->cvfile = UploadedFile::getInstance($model, 'cvfile');
            if ($model->cvfile) $model->upload();

            foreach ($jobs as $job) {
                $count += $this->applyJob($model, trim($job));
            }

            $model->removeTmpFiles();

            $campaign->apply += $count;
            $campaign->save(false, ['apply']);
        }

        return $this->asJson(['status' => 'success', 'html' => $this->renderPartial('_submitSuccess', ['count' => $count])]);
    }

    private function applyJob($model, $job)
    {
        $search = new Search($model->supplierId);
        $model->jobDetails = $search->getJobById($job);

        return $model->contact(Yii::$app->params['cvWebMail'], $this->renderPartial('_cvView', ['model' => $model]));
    }
}
