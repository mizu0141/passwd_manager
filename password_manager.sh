#!/bin/bash

# 暗号化キーの発行
cipher_key="your_original_key"

#パスワードデータ保存ディレクトリの作成
data_directory="password_data"
mkdir -p  $data_directory

function Add_Password() {
  read -p "サービス名を入力してください: " service_name
  read -p "ユーザー名を入力してください: " user_name
  read -p "パスワードを入力してください: " password
  echo ""

  # ディレクトリにパスワードを保存
  file_name="${data_directory}/${service_name}_${user_name}.txt"
  echo "サービス名: $service_name" > $file_name
  echo "ユーザー名: $user_name" >> $file_name
  echo "パスワード: $password" >> $file_name

  # 暗号化したファイルの生成
  gpg -c --batch --yes --passphrase "$cipher_key" -o "${file_name}.gpg" $file_name

  # 暗号化前のファイル削除
  rm $file_name

  echo "パスワードの追加は成功いたしました。"
}

function Get_Password() {
  read -p "サービス名を入力してください: " service_name
  # 入力されたサービス名に一致するファイルパターンを用意
  file_pattern="${data_directory}/${service_name}_*.txt.gpg"

  # 一致するファイルが存在しない場合
  if ! ls $file_pattern 1> /dev/null 2>&1; then
    echo "そのサービスは登録されていません"
  # 一致するファイルが存在する場合
  else
    for cipher_file in $file_pattern; do
      decipher_file="${cipher_file%.gpg}"
      gpg --quiet --batch --yes --passphrase "$cipher_key" -o "$decipher_file" -d "$cipher_file"
      cat "$decipher_file"
      rm "$decipher_file"
    done
  fi
}

echo "パスワードマネージャーへようこそ！"

while true; do
  echo "次の選択肢から入力して下さい(Add Password/Get Password/Exit):"
  read action

  case $action in
    "Add Password")
       Add_Password
       ;;
     "Get Password")
       Get_Password
       ;;
      "Exit")
        echo "Thank you!"
        exit 0
        ;;
      *)
        echo "入力が間違えています。Add Password/Get Password/Exitから入力してください。"
        ;;
  esac
 done

