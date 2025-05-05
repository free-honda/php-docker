<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>メッセージ投稿</title>
</head>
<body>
    <h1>メッセージ投稿フォーム</h1>

    @if(session('success'))
        <p style="color:green">{{ session('success') }}</p>
    @endif

    <form action="/message" method="POST">
        @csrf
        <label>名前: <input type="text" name="name" required></label><br><br>
        <label>メッセージ:<br><textarea name="message" rows="5" cols="40" required></textarea></label><br><br>
        <button type="submit">送信</button>
    </form>
</body>
</html>
