<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HelloController;
use App\Http\Controllers\MessageController;
use App\Http\Controllers\AuthController;

Route::get('/', function () {
    return view('welcome');
});

// Hello関連
Route::get('/hello', [HelloController::class, 'index']);
Route::post('/hello', [HelloController::class, 'post']);

// Message関連
Route::get('/message', [MessageController::class, 'create']);
Route::post('/message', [MessageController::class, 'store']);

// 新規登録関連
Route::get('/register', [AuthController::class, 'showRegisterForm']);
Route::post('/register', [AuthController::class, 'register']);
