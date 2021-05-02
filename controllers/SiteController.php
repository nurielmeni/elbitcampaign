<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;
use app\models\FbfContactForm;
use app\models\Campaign;
use yii\web\UploadedFile;

class SiteController extends Controller
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
        $campaign = Campaign::findOne($id);
        
        
        if ($campaign === null) {
            throw new \yii\web\NotFoundHttpException(Yii::t('app', 'A campaign with this ID could not be found'));
        }
        
        $now = time();
        if ($campaign->start_date_int > $now || (isset($campaign->end_date_int) && $campaign->end_date_int < $now)) {
            throw new \yii\web\NotFoundHttpException(Yii::t('app', 'The campaign is not active!'));
        }

        if ($campaign->fbf === 0) {
            $model = new ContactForm();
            //if ($campaign->show_store) $model->scenario = 'showStore';
            $model->supplierId = Yii::$app->request->get('sid', (empty($campaign->sid) ? Yii::$app->params['supplierId'] : $campaign->sid));
        } else {
            $model =  new FbfContactForm();
            $model->supplierId = Yii::$app->request->get('sid', (empty($campaign->sid) ? Yii::$app->params['supplierIdFbf'] : $campaign->sid));
        }
        
        if ($model->load(Yii::$app->request->post())) {
            $model->cvfile = UploadedFile::getInstance($model, 'cvfile');
            if ($model->cvfile) $model->upload();
            if ($model->contact(Yii::$app->params['cvWebMail'], $this->renderPartial('_cvView', ['model' => $model]))) {
                $campaign->apply += 1;
                $campaign->save(false, ['apply']);
                Yii::$app->session->setFlash('contactFormSubmitted');
            } else {
                Yii::$app->session->setFlash('danger', Yii::t('app', 'We are sorry, There was a problem with the application'));
            }
        } else {
            $campaign->hits += 1;
            $campaign->save(false, ['hits']);
        }
        
        return $this->render('contact', [
            'campaign' => $campaign,
            'model' => $model,
        ]);
    }
    
    public function actionApplicant() {
        $request = Yii::$app->request;
        $id = $request->post('id', '');
        $del = $request->post('del', false);
        $model = new FbfContactForm();
        return $this->renderAjax('applicant', [
            'model' => $model,
            'id' => $id,
            'del' => $del,
        ]);
    }
}
