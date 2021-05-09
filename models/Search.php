<?php

namespace app\models;

use Yii;
use yii\base\Model;
use kartik\mpdf\Pdf;
use yii\helpers\ArrayHelper;
use app\components\Niloos;
use app\helpers\Helper;
use stdClass;

/**
 * ContactForm is the model behind the contact form.
 */
class Search extends Model {

    const LANG_HEB = '1037';
    const LANG_ENG = '1033';
    
    private $niloos;
    private $supplierId;
    private $sellStatus;
    
    public function __construct($supplierId = null) {
        parent::__construct();
        if ($supplierId === null) {
            \Yii::error('No supplier id provided for search ', 'Niloos Search');
            die;
        }

        $this->niloos = new Niloos();
        $this->supplierId = $supplierId;
        $sellStatus = key_exists('sellStatus', Yii::$app->params) 
            ? Yii::$app->params['sellStatus']
            : null;
    }
    
    public function suppliersGetByFilter2() {
        /**
         * 
         * 
            
        CardFilter filter = new CardFilter();
        filter.Select(
            CardFilterFields.CardId,
            CardFilterFields.EntityLocalName,
            CardFilterFields.OfficeAddressCountryName,
            CardFilterFields.OfficeAddressCityName,
            CardFilterFields.SupplierTypeText,
            CardFilterFields.SupplierRankText,
            CardFilterFields.OfficePhone,
            CardFilterFields.UpdateDate
        );

        filter.From(FilterFrom.Suppliers);//3
        
        CardFilterWhere cardFilterWhere = new CardFilterWhere();
        cardFilterWhere.Filters = new List<CardFilterField>();
        cardFilterWhere.Condition = LogicalCondition.AND;
        cardFilterWhere.Filters.Add(new CardFilterField(){
            Field = CardFilterFields.SellsStatus,
            SearchPhrase = FilterSearchPhrase.Exact,
            Value = “here comes the supplier’s type”
        });
        filter.OrderBy(new CardFilterSort() { Field = CardFilterFields.EntityLocalName, Direction = FilterSortDirection.Ascending });

         * 
         *   
         * */
        
        $filter = [
            'FromView' => 'Suppliers',
            'SelectFilterFields' => [
                'CardId',
                'EntityLocalName',
                //'OfficeAddressCountryName',
                //'OfficeAddressCityName',
                //'SupplierTypeText',
                //'SupplierRankText',
                //'OfficePhone',
                //'UpdateDate',
            ],
            'OrderByFilterSort' => [
                [
                    'Field' => 'EntityLocalName',
                    'Direction' => 'Ascending',
                ],
            ],
        ];

        if ($this->sellStatus) {
            $filter['WhereFilters'] = [
                $this->addWhereFilter('AND', 'SellsStatus', 'Exact', $this->sellStatus),
            ];
        }
         


        return $this->niloos->suppliersGetByFilter2($filter);
    }
    
    /**
     * This function will add a where filter to the $obj
     * @author Meni Nuriel
     * @version 1.0 this version tag is parsed
     */
    private function addWhereFilter($condition, $field, $searchPhrase, $values) {
        $JobFilterFields = [];
        is_array($values) ?: $values = [$values];

        foreach ($values as $value) {
            $JobFilterField = [
                'Field' => $field,
                'SearchPhrase' => $searchPhrase,
                'Value' => $value,
            ];
            $JobFilterFields[] = $JobFilterField;
        }
        
        // Then: build the FilterWhere
        $JobFilterWhere = [
            'Filters' => $JobFilterFields,
            'Condition' => $condition
        ];
        
        // Last: add the FilterWhere object above to WhereFilters array of your filter
        return $JobFilterWhere;
    }

    
    public function jobsByCategories($categories = []) {
    /**
     * Object type of search
     *
        $filter = new stdClass();
        $filter->jobFilter = new stdClass();
        $filter->jobFilter->FromView = "Jobs";
        $filter->jobFilter->NumberOfRows = 10000;
        $filter->jobFilter->OffsetIndex = 0;

        $filter->jobFilter->SelectFilterFields = new stdClass();
        $filter->jobFilter->SelectFilterFields->JobFilterFields = ['JobId, JobTitle'];
        $filter->jobFilter->WhereFilters->JobFilterWhere[] = $this->addWhereFilter('OR', 'CategoryId', 'Exact', $categories);
        $filter->jobFilter->WhereFilters->JobFilterWhere[] = $this->addWhereFilter('AND', 'SupplierId', 'Exact', $this->supplierId);
        $filter->jobFilter->OrderByFilterSort = new stdClass();

        $JobFilterSort = new stdClass();
        $JobFilterSort->Field = 'JobTitle';
        $JobFilterSort->Direction = 'Ascending';
        
        $filter->jobFilter->OrderByFilterSort->JobFilterSort = [$JobFilterSort];

        $filter->transactionCode = Helper::newGuid();
        $filter->LanguageId = self::LANG_HEB;
     * 
     * End of object
    **/
            
        $filter = [
            'transactionCode' => Helper::newGuid(),
            'LanguageId' => self::LANG_HEB,
            'jobFilter' => [
                'FromView' => 'Jobs',
                'NumberOfRows' => 10000,
                'OffsetIndex' => 0,
                'SelectFilterFields' => [
                    'JobFilterFields' => [
//                        'CityId', 
//                        'CountryCodeFIPS', 
                        'Description', 
                        'JobId', 
//                        'JobSeniority', 
                        'JobTitle', 
                        'JobCode',
//                        'OpenDate',
//                        'CategoryId',
//                        'OpenPositions', 
//                        'Rank', 
//                        'RegionValue', 
//                        'Requiremets', 
//                        'Skills', 
//                        'YearsOfExperience',
//                        'EmployerName',
//                        'JobScope',
//                        'EmployerId',
                        'RegionText',
//                        'EmploymentType',
                        'UpdateDate',
//                        'ExpertiseId',
//                        'ProfessionalFieldId'
                    ],
                ],
                'OrderByFilterSort' => [
                    'JobFilterSort' => [
                        [
                            'Field' => 'JobTitle',
                            'Direction' => 'Ascending',
                        ],
                    ],
                ],
                'WhereFilters' => [
                    'JobFilterWhere' => [
                        //$this->addWhereFilter('OR', 'CategoryId', 'Exact', $categories),
                        $this->addWhereFilter('AND', 'SupplierId', 'Exact', $this->supplierId),
                    ],
                ],
            ]
        ];
//                        print '<pre style="direction:ltr;"><code>';
//                        print_r($filter);
//                        print '</code></pre>';
        $cacheKey = $this->supplierId . implode('', $categories);
        return $this->niloos->jobsGetByFilter($filter, $cacheKey);
    }
    
    public function getJobById($id) {
        return $this->niloos->jobGetConsideringIsDiscreetFiled($id); 
    }

    public function jobs($full = false) {
        $filter = [
            'transactionCode' => Helper::newGuid(),
            'LanguageId' => self::LANG_HEB,
            'jobFilter' => [
                'FromView' => 'Jobs',
                'NumberOfRows' => key_exists('maxNumberOfJobs', Yii::$app->params) ? Yii::$app->params['maxNumberOfJobs'] : 1000,
                'OffsetIndex' => 0,
                'SelectFilterFields' => [
                    'JobFilterFields' => [
//                        'CityId', 
//                        'CountryCodeFIPS', 
                        'Description', 
                        'JobId', 
//                        'JobSeniority', 
                        'JobTitle', 
                        'JobCode',
//                        'OpenDate',
//                        'CategoryId',
//                        'OpenPositions', 
//                        'Rank', 
                        'RegionValue', 
                        'Requiremets', 
//                        'Skills', 
//                        'YearsOfExperience',
//                        'EmployerName',
//                        'JobScope',
//                        'EmployerId',
                        'RegionText',
//                        'EmploymentType',
                        'UpdateDate',
//                        'ExpertiseId',
//                        'ProfessionalFieldId'
                    ],
                ],
                'OrderByFilterSort' => [
                    'JobFilterSort' => [
                        [
                            'Field' => 'JobTitle',
                            'Direction' => 'Ascending',
                        ],
                    ],
                ],
                'WhereFilters' => [
                    'JobFilterWhere' => [
                        //$this->addWhereFilter('OR', 'CategoryId', 'Exact', $categories),
                        $this->addWhereFilter('AND', 'SupplierId', 'Exact', $this->supplierId),
                    ],
                ],
            ]
        ];
                    //    print '<pre style="direction:ltr;"><code>';
                    //    print_r($filter);
                    //    print '</code></pre>';
        $cacheKey = $this->supplierId;
        $jobs = $this->niloos->jobsGetByFilter($filter, $cacheKey);
        $cities = $this->niloos->getListByName('Cities');
        
        if  ($full && is_array($jobs)) {
            foreach($jobs as &$job) {
                key_exists('JobId', $job)
                    ? $job['JobDetails'] = $this->niloos->jobGetConsideringIsDiscreetFiled($job['JobId'])               
                    : $job['JobDetails'] = [];  

                if(property_exists($job['JobDetails'], 'ExtendedProperties')) {
                    $exProps = is_array($job['JobDetails']->ExtendedProperties) 
                        ? $job['JobDetails']['ExtendedProperties']
                        : [$job['JobDetails']->ExtendedProperties];
                    $cityId = Helper::getExtendedProperty($exProps, 'Cities');
                    $job['CityName'] = key_exists($cityId, $cities) ? $cities[$cityId] : '';
                }
            }
        }
        return $jobs;
    }
}
