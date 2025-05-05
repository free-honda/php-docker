<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    // 保存を許可するカラムを指定
    protected $fillable = ['name', 'message'];
}
