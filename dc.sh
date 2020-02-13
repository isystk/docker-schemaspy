#! /bin/bash

pushd ./docker

MYSQL_CLIENT=$(dirname $0)/mysql/scripts
PATH=$PATH:$MYSQL_CLIENT

function usage {
    cat <<EOF
$(basename ${0}) is a tool for ...

Usage:
  $(basename ${0}) [command] [<options>]

Options:
  stats|st                 Dockerコンテナの状態を表示します。
  init                     Dockerコンテナ・イメージ・生成ファイルの状態を初期化します。
  start                    すべてのDaemonを起動します。
  stop                     すべてのDaemonを停止します。
  mysql start              MySQLを起動します。
  mysql stop               MySQLを停止します。
  mysql restart            MySQLを再起動します。
  schemaspy                schemaspyを実行します。
  --version, -v     バージョンを表示します。
  --help, -h        ヘルプを表示します。
EOF
}

function version {
    echo "$(basename ${0}) version 0.0.1 "
}

case ${1} in
    stats|st)
        docker container stats
    ;;

    init)
        # 停止＆削除（コンテナ・イメージ・ボリューム）
        docker-compose down --rmi all --volumes
        rm -Rf ./mysql/data/*
        rm -Rf ./mysql/logs/*
        rm -Rf ../public/*
    ;;

    start)
        docker-compose up -d
    ;;

    stop)
        docker-compose stop && docker-compose rm -fv
    ;;

    apache)
      case ${2} in
          start)
              docker-compose up -d apache
          ;;
          stop)
              docker-compose stop apache && docker-compose rm -fv apache
          ;;
          restart)
              ${0} ${1} stop && ${0} ${1} start
          ;;
          *)
              usage
          ;;
      esac
    ;;

    mysql)
      case ${2} in
          start)
              docker-compose up -d mysql
          ;;
          stop)
              docker-compose stop mysql && docker-compose rm -fv mysql
          ;;
          restart)
              ${0} ${1} stop && ${0} ${1} start
          ;;
          login)
              mysql -u root -ppassword -h 127.0.0.1  
          ;;
          *)
              usage
          ;;
      esac
    ;;

    schemaspy)
        rm -Rf ../public/*
        docker-compose up -d schemaspy
    ;;

    help|--help|-h)
        usage
    ;;

    version|--version|-v)
        version
    ;;
    
    *)
        echo "[ERROR] Invalid subcommand '${1}'"
        usage
        exit 1
    ;;
esac


