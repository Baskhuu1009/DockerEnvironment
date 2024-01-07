#docker run -d --env-file ora_db_env.dat -p 1521:1521 --name oracle-std --shm-size="8g" container-registry.oracle.com/database/free:latest
#FROM container-registry.oracle.com/database/free:latest
#FROM container-registry.oracle.com/database/enterprise:19.3.0.0
FROM container-registry.oracle.com/database/express:21.3.0-xe

# コンテナ内に/appディレクトリを作成します
WORKDIR /dumps
WORKDIR /initdb.d

# DB起動とサンプルTBL作成スクリプトを追加
COPY ./oracle/initdb.d/ /initdb.d/
COPY ./oracle/startup.sh /home/oracle/startup.sh

ENV LANG ja_JP.utf8