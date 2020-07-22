<?php
namespace app\models;

use yii\base\Model;

class SearchForm extends Model
{
    public $country;

    public $value_de;

    public $value_ds;

    public $limit = 6;

    public $page;

    public function rules()
    {
       return [
            [['country','page','limit'],'integer'],
            ['page', 'default', 'value' => 1],
            ['country','filter', 'filter' => function ($id) { return ((int) $id) ? $id : null; } ],
            ['value_de', 'required', 'message' => 'Укажите дату прилета'],
            ['value_ds', 'required', 'message' => 'Укажите дату вылета'],
            [['value_de','value_ds'], 'match', 'pattern' => '~^\d{2}\.\d{2}\.\d{4}$~'],
            [['value_de','value_ds'],'filter', 'filter' => [$this, 'normalizeDate']]
       ];
    }

    public function normalizeDate($value){
        return \Yii::$app->formatter->asDate($value, 'php:Y-m-d');
    }

    public function search(){

        $req = Tur::find()
            ->joinWith(['hotel.country'])
            ->joinWith(['hotel.images'])
            ->joinWith(['hotel.city'])
            ->filterWhere([
                Country::tableName() . '.id' => $this->country
            ])
            ->andFilterCompare (Tur::tableName() . '.date_s',$this->value_ds, '>=')
            ->andFilterCompare (Tur::tableName() . '.date_e', $this->value_de, '<=');
            return [
                'pages' => $this->getPages($this->count($req)),
                'data' => $this->select($req, $this->setOffset()),
                'errors' => []
            ];
    }

    public function setOffset(){
        return $this->page * $this->limit - $this->limit;
    }

    public function select($req, $offset){
            return $req->groupBy(Tur::tableName() . '.id')
                ->orderBy(Tur::tableName() . '.id')
                ->limit($this->limit)
                ->offset($offset)
                ->asArray()
                ->all();
    }

    public function count($req){
        return $req->groupBy(Tur::tableName() . '.id')->count();
    }

    public function getPages($count_tours){

        $pages = [];
        $count_page = ceil ($count_tours / $this->limit);

        if($count_page > 1) {
            for ($i = 1; $i <= $count_page; $i++) {
                $pages[] = $i;
            }
        }
        return $pages;
    }

}