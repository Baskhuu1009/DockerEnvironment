from flask import Flask, jsonify
import oracledb

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def get_employees():
    con = oracledb.connect(
        user="system", 
        password="password", #Docker composeで設定したパスワード
        dsn="192.168.112.1:1521/XE") #コンテナ起動毎にIPが変わる
    
    cur = con.cursor()
    cur.execute("""SELECT * FROM EMPLOYEES""") #サンプルテーブル名
    # 1行だけフェッチする
    #cur.fetchone()

    records = []
    # 残り全行フェッチする
    rows = cur.fetchall()
    index = 1
    for r in rows:
        data = {'Record '+str(index): r}
        records.append(data)
        index=index + 1

    # カーソルとコネクションをクローズする
    cur.close()
    con.close()
    
    return jsonify(records)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5432)