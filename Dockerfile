# Rubyのバージョンを指定
FROM ruby:3.2.0

# 必要なパッケージのインストール
RUN apt-get update -qq && apt-get install -y nodejs npm sqlite3 libsqlite3-dev
RUN npm install --global yarn

#docker内の作業ディレクトリを作成＆設定
WORKDIR /rails_hotel_search_linebot

#Gemfile,Gemfile.lockをローカルからCOPY
COPY Gemfile Gemfile.lock /rails_hotel_search_linebot/

#コンテナ内にコピーしたGemfileを用いてbundel install
RUN bundle install --path vendor/bundle

#railsを起動する
CMD ["rails", "server", "-b", "0.0.0.0"]
