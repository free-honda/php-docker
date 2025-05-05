<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Message;

class MessageController extends Controller
{
    public function create()
    {
        return view('message.create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|max:255',
            'message' => 'required',
        ]);

        Message::create($validated);

        return redirect('/message')->with('success', '保存しました！');
    }
}
