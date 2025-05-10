# PHP 8.2 + Apache の公式イメージをベースにする
FROM php:8.2-apache

# Laravelで必要なパッケージをインストール（zip, git, curl など）
RUN apt-get update && apt-get install -y \
    zip unzip git curl libzip-dev libonig-dev \
    && docker-php-ext-install pdo_mysql zip

# Composer（PHPのパッケージ管理ツール）をインストール
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Apache のドキュメントルートを Laravel の public ディレクトリに変更
RUN sed -i 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/000-default.conf

# mod_rewrite を有効化（.htaccess が使えるように）
RUN a2enmod rewrite

# ✅ Laravel CLIが正しく動くように、作業ディレクトリはアプリルートにする
WORKDIR /var/www/html

# Laravelアプリのソースコードをコピー（public/ も含まれる）
COPY src/ /var/www/html/

# ✅ オートローダー再生成
RUN composer install --no-interaction --prefer-dist --optimize-autoloader \
    && composer dump-autoload
