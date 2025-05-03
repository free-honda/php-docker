# PHP 8.2 + Apache の公式イメージをベースにする
FROM php:8.2-apache

# Laravelで必要なパッケージをインストール（zip, git, curl など）
RUN apt-get update && apt-get install -y \
    zip unzip git curl libzip-dev libonig-dev \
    && docker-php-ext-install pdo_mysql zip

# Composer（PHPのパッケージ管理ツール）をインストール
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# LaravelのpublicフォルダをApacheのルートに指定
RUN sed -i 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/000-default.conf

# 作業ディレクトリをApacheのドキュメントルートに設定
WORKDIR /var/www/html

# Laravelアプリのソースコードをコピー（最初は空でもOK）
COPY src/ /var/www/html/
