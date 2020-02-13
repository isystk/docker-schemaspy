docker-schemaspy
====

## Description

Dockerでschemaspyを起動してデータベース内のER図を参照するサンプルです。

### ディレクトリ構造
```
.
├── docker
│   ├── apache （Webサーバー）
│   │   ├── conf.d (apacheの設定ファイル)
│   │   └── logs （apacheのログ）
│   ├── mysql （DBサーバー）
│   │   ├── conf.d (mysqlの設定ファイル)
│   │   ├── data (mysqlのデータファイル)
│   │   ├── init （mysqlの初期DDL）
│   │   ├── logs （mysqlのログ）
│   │   └── script （mysql関連のスクリプト）
│   └── schemaspy
├── public （ER図が出力されるディレクトリ）
└── dc.sh （Dockerの起動用スクリプト）
```

## Demo

## VS. 

## Requirement

## Usage

### DockerWindows(WSL)を利用している場合は以下の設定が必要です。
$ vi ~/.bashrc
``` 
export DOCKER_HOST=tcp://localhost:2375
```

$ sudo vi /etc/wsl.conf
``` 
[automount]
root = /
options = "metadata"
```

### 使い方
$ dc.sh -h
```
Usage:  dc.sh [command] [<options>]

Options:
  stats|st                 Dockerコンテナの状態を表示します。
  init                     Dockerコンテナ・イメージ・生成ファイルの状態を初期化します。
  start                    すべてのDaemonを起動します。
  stop                     すべてのDaemonを停止します。
  mysql login              MySQLデータベースにログインします。
  schemaspy                schemaspyを実行します。
  --version, -v     バージョンを表示します。
  --help, -h        ヘルプを表示します。
```

## Install

```
./dc.sh start
./dc.sh schemaspy
open http://localhost/
```

## Contribution

## Licence

[MIT](https://github.com/isystk/docker-schemaspy/LICENCE)

## Author

[isystk](https://github.com/isystk)


