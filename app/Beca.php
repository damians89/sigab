<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class Beca extends Model
{
    protected $fillable = [
        'nombre', 'descripcion',
    ];


    protected static function boot()
    {
        parent::boot();
        static::addGlobalScope('order', function (Builder $builder) {
            $builder->orderBy('nombre', 'asc');
        });
}

}
	