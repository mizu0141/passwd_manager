## パスワードマネージャーの使い方

### 事前にGnuPGのダウンロードをお願い致します。

### 1. パスワードマネージャーをダウンロード
右のCODEからzipファイルをダウンロードしてください。  
### 2. パスワードマネージャーを実行
ダウンロードしたディレクトリから”password_manager.zsh”を探してください。  

ファイルの実行権限をあたえるため、以下のコマンドを入力して下さい。  
 ```bash:bash
$ chmod  755 password_manager.zsh
```
コマンドが入力できたら次のコマンドを入力して下さい。
 ```bash:bash
$ ./password_manager.zsh
```
パスワードマネージャーが起動できました。

### 3. 機能の説明
パスワードマネージャーには2つの機能があります。
#### 1. パスワードの追加 (Add Password)    
パスワードの追加は、サービス名、ユーザー名、パスワードの3つをファイルに保存して行います。  
保存されたファイルは password_dataに格納されているので確認してみてください。  
その際、ファイルを開けても文字化けして、内容が読み取れないようにしてあります。

#### 2. パスワードの検索 (Get Password)  
パスワードの検索はサービス名を入力すると、サービス名とユーザー名を表示してくれます。

