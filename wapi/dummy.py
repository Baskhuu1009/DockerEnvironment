import oracledb

connection = oracledb.connect(
    user="system", 
    password="password", #Docker composeで設定したパスワード
    dsn="192.168.112.1:1521/XE") #コンテナ起動毎にIPが変わる
    
cur = connection.cursor()
cur.execute("""SELECT * FROM EMPLOYEES""")

# 1行だけフェッチする
cur.fetchone()
# 残り全行フェッチする
rows = cur.fetchall()
for r in rows:
    print(r)
# カーソルとコネクションをクローズする
cur.close()
connection.close()