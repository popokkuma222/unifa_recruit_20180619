# unifa_recruit_20180619
ユニファ株式会社様　採用面接課題

起動方法
# DB作成
rake db:create
# migrate
rake db:migrate
# ユーザ作成
rails console
User.create(user_id: "abc", password: "Test123")
exit
# Rails起動
rails s

下記アクセスする
http://localhost:3000
ユーザID：　User作成時のuser_id
パスワード：　User作成時のpassword
