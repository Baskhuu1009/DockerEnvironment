# ベースイメージとしてPython公式イメージを使用します
FROM python:3.9-slim

# リージョンと日本語の環境変数
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
ENV NLS_LANG=Japanese_Japan.AL32UTF8

# コンテナ内に/wapiディレクトリを作成します
WORKDIR /wapi

# カレントディレクトリのコードをコンテナ内の/wapiにコピーします
COPY . /wapi
COPY ./wapi/requirements.txt /wapi/

# 必要なパッケージをインストールします
RUN pip install --upgrade pip
RUN pip install --no-cache-dir flask
RUN pip install --no-cache-dir -r requirements.txt
RUN python -m pip install oracledb --upgrade

# Flaskアプリを起動するコマンドを指定します
CMD [ "python", "webapi.py" ]