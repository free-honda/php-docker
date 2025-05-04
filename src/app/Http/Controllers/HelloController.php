<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HelloController extends Controller
{
    public function index()
    {
        return view('hello'); // フォームだけ表示
    }

    public function post(Request $request)
    {
        $name = $request->input('name'); // 入力された名前を取得
        return view('hello', ['name' => $name]); // 名前付きで再表示
    }
}
