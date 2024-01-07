OracleデータベースとFlask webapi（Python3.9）アプリのDocker環境構築：

1. 事前条件
    - ec2(Dockerコンテナ起動する)インスタンスサイズはt3.large以上であること
    - ec2(Dockerコンテナ起動する)インスタンスEBSサイズは30GB以上であること
    - ec2にてdocker-composeインストール（https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-centos-7）
    - Oracle DBのイメージとコンテナ起動用ディレクトリサイズを30GB以上である (参照：https://jhooq.com/docker-error-no-space-left/#4default-docker-storage-ie---_varlibdocker_)

2. 作業用ディレクトリに移動
    - 作業用ディレクトリ作成と移動してoracleWithDockerクローン
    - クローンしたoracleWithDockerアプリのdocker-composeYMLファイルがあるディレクトリに移動

3. ”docker-compose up -d --build”を実行すると下記2環境のイメージ及びコンテナが起動
    １。oraclewithdocker_oracle（Oracleデータベース）
    ２。oraclewithdocker_wapi（Flask webapiアプリ環境）


　　Dockerコマンド一覧：
        - docker images -> イメージ一覧
        - docker ps -> コンテナ一覧
        - docker system df -> dockerメモリ確認
　　    - docker system prune --all ->  dockerメモリ上での全部(イメージ、コンテナ、キャシュー)削除
        - docker-compose down -> 全コンテナ削除
        - docker network create ネットワーク名（docker-network） -> コンテナネットワーク作成 
        - docker network inspect ネットワーク名（docker-network） -> コンテナのホスト（IPアドレス）確認
        - docker logs -f --tail=100 コンテナ名 -> コンテナのログ確認
        - docker exec -it コンテナ名 sqlplus system/password@XE -> ホストからSQLにログイン
        - sqlplus / as sysdba -> Adminとしてログイン
        - SQL> startup -> Oracle DB起動
        - lsnrctl start -> リスナー起動

4. 各環境の動作確認（ec2）
    1. 以下のcurlコマンドを叩くと、テストFlask WebAPI起動し、
    　　Oracleデータベースからテスト用を取得して表示すればOK
        curl http://127.0.0.1:5432/

    2. Oracleデータベース
        sqlplus / as sysdba -> データベースにログイン
        initdb.d下のsample.sqlを使ってテスト用テーブル作成とデータをinsert
        