<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>Helloページ</title>
</head>
<body>
    <h1>名前を入力してください</h1>

    <form action="/hello" method="POST">
        @csrf
        <input type="text" name="name" placeholder="お名前">
        <button type="submit">送信</button>
    </form>

    @isset($name)
        <p>こんにちは、{{ $name }}さん！</p>
    @endisset
</body>
</html>
