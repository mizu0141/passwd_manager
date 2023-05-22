#!/bin/bash

echo "パスワードマネージャーへようこそ！"

# サービス名、ユーザー名、パスワードの入力
read -p "サービス名を入力してください: " service_name
read -p "ユーザー名を入力してください: " username
read -p "パスワードを入力してください: " password
echo ""

# 入力された情報をファイルに保存する
filename="${service_name}_${username}_${password}.txt"
echo "サービス名: $service_name" > $filename
echo "ユーザー名: $username" >> $filename
echo "パスワード: $password" >> $filename

# 完了のメッセージを表示
echo "Thank you!"

# プルリクエスト
