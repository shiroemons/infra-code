# infra-code

## 事前準備

```
$ bundle install --path vendor/bundle
$ cp .env.sample .env
```

## ユーザー名

- 追加するユーザー名を.envに追記

```:.env
USER_NAME="xxxxx"
```

## パスワード準備

- SHA512で暗号化されたパスワードを生成する
- mkunixcryptのオプションで指定している"salt"は、乱数種のため、任意の文字列に変更して生成しても良い

```
$ bundle exec mkunixcrypt -s "salt"
Enter password:  # パスワードを入力する
Verify password:  # 確認用パスワードを入力する
$6$salt$...  # SHA512で暗号化されたパスワードが出力される
```

- 生成されたSHA512で暗号化されたパスワードを.envに追記

```:.env
PASSWORD=$6$salt$...
```

## ssh-key

- ssh keyを.envに追記

```:.env
SSH_KEY="ssh-rsa AAAA..."
```

## Itamae実行

```
$ bundle exec itamae ssh user_recipe.rb -h [IPアドレス] -u root
```
