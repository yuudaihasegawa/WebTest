# README

お忙しい中、申し訳ございません。
サンプルサイトをデプロイしたのですが、errorが発生し対応したのですが力及ばず時間内に解決ができませんでした。  
もしローカル環境でサイトをご覧になって頂く場合は、お手数ですがGitHubからダウンロード後に仮想環境下にFileを移動した上で  
WebTestディレイトリで下記の手順でコマンドを実行するとご覧いただけます。  
  
1. bundle install --without production  
2. bin/rails db:migrate RAILS_ENV=development  
3. rails s -b 0.0.0.0  
  
  
  
  
  

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
