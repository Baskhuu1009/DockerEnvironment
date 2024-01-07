#!/bin/bash

# Start Oracle Listener
lsnrctl start
echo "Oracle Listener started successfully. BASKHUU"

# Start Oracle Database
sqlplus / as sysdba << EOF
startup;
exit;
echo "Oracle Database started successfully. BASKHUU"
EOF

# Keep the script running to keep the container alive
tail -f /dev/null



# Oracleデータベースの起動
/etc/init.d/oracle start

# Oracleデータベースが起動するまで待機
while true; do
  echo "Waiting for Oracle Database to start..."
  sleep 10
  if [ -f "$ORACLE_BASE/oradata/${ORACLE_SID}/controlfile/controlfile.dbf" ]; then
    echo "Oracle Database has started successfully."
    break
  fi
done

# データベース初期化処理（パスワード変更など）
echo "Initializing Oracle Database..."
sqlplus sys/$ORACLE_PWD@localhost:1521/$ORACLE_SID as sysdba << EOF
  ALTER USER system IDENTIFIED BY $ORACLE_PWD;
  ALTER USER pdbadmin IDENTIFIED BY $ORACLE_PWD;
  ALTER SESSION SET CONTAINER=$ORACLE_PDB;
  ALTER PLUGGABLE DATABASE $ORACLE_PDB SAVE STATE;
  exit;
EOF

# コンテナが終了しないようにして監視
tail -f /dev/null