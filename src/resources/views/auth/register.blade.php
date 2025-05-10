<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>ユーザー登録</title>
</head>
<body>
    <h1>ユーザー登録フォーム</h1>

    @if (session('success'))
        <p style="color:green">{{ session('success') }}</p>
    @endif

    @if ($errors->any())
        <ul style="color:red;">
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    @endif

    <form method="POST" action="/register">
        @csrf
        <label>名前: <input type="text" name="name" value="{{ old('name') }}"></label><br>
        <label>メールアドレス: <input type="email" name="email" value="{{ old('email') }}"></label><br>
        <label>パスワード: <input type="password" name="password"></label><br>
        <label>パスワード（確認）: <input type="password" name="password_confirmation"></label><br>
        <button type="submit">登録</button>
    </form>
</body>
</html>
