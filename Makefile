.PHONY: start stop build init-laravel

# コンテナをビルドして起動（リアルタイムログ付き）
start:
	docker compose up --build

# コンテナをすべて停止・削除
stop:
	docker compose down

# コンテナの再ビルド
build:
	docker compose build

# Laravelアプリを初期化（src フォルダにプロジェクトを作成）
init-laravel:
	docker compose run --rm app composer create-project laravel/laravel .

# PHP/Laravelアプリのシェルに入る
shell-app:
	docker exec -it php-app bash

# MySQLコンテナにログイン（MySQLクライアントでDBに接続）
shell-db:
	docker exec -it php-db mysql -ularavel -psecret laravel

# phpMyAdminコンテナにシェルログイン（必要に応じて）
shell-phpmyadmin:
	docker exec -it php-phpmyadmin sh

# Laravelのキャッシュをすべてクリアする
cache-clear:
	docker exec -it php-app php artisan config:clear
	docker exec -it php-app php artisan route:clear
	docker exec -it php-app php artisan view:clear
