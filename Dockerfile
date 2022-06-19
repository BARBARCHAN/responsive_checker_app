FROM ruby:2.6.5
# ベースにするイメージを指定

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-mysql-client vim
# RailsのインストールやMySQLへの接続に必要なパッケージをインストール

RUN mkdir /responsive_checker_app
# コンテナ内にmyappディレクトリを作成

WORKDIR /responsive_checker_app
# 作成したmyappディレクトリを作業用ディレクトリとして設定

RUN gem install bundler
# bundlerをインストールする

COPY Gemfile /responsive_checker_app/Gemfile
COPY Gemfile.lock /responsive_checker_app/Gemfile.lock
# ローカルの Gemfile と Gemfile.lock をコンテナ内のmyapp配下にコピー

RUN bundle install
# コンテナ内にコピーした Gemfile の bundle install

COPY . /responsive_checker_app
# ローカルのmyapp配下のファイルをコンテナ内のmyapp配下にコピー

RUN yarn install
# コンテナ内でyarn installする