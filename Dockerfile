# PHP 8.2 + Apache の公式イメージをベースにする
FROM php:8.2-apache

# Laravelで必要なパッケージをインストール（zip, git, curl など）
RUN apt-get update && apt-get install -y \
    zip unzip git curl libzip-dev libonig-dev \
    && docker-php-ext-install pdo_mysql zip

# Composer（PHPのパッケージ管理ツール）をインストール
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# LaravelのpublicフォルダをApacheのドキュメントルートに設定
RUN sed -i 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/000-default.conf

# .htaccess を使うために mod_rewrite を有効化
RUN a2enmod rewrite

# 作業ディレクトリを Laravel の public に設定
WORKDIR /var/www/html/public

# Laravelアプリのソースコードをコピー
COPY src/ /var/www/html/
