FROM ubuntu:latest

# ここはchromeのバージョンに合わせて変える。
# ARG CHROME_DRIVER_URL=https://chromedriver.storage.googleapis.com/90.0.4430.24/chromedriver_linux64.zip
ARG CHROME_DRIVER_URL=https://chromedriver.storage.googleapis.com/96.0.4664.45/chromedriver_linux64.zip

# 環境変数設定
ENV TZ=Asia/Tokyo
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG ja_JP.UTF-8
ENV PYTHONIOENCODIND utf_8

RUN mkdir -p /root/src
COPY requirements.txt /root/src
WORKDIR /root/src

# 色々とインストール
RUN apt-get update
RUN apt-get install -y python3.8 curl wget unzip python3.8-distutils gnupg sudo apt-utils tzdata

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list && \
apt-get update && \
apt-get install -y google-chrome-stable && \
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
rm -f /usr/bin/python /usr/bin/python3 && \
ln /usr/bin/python3.8 /usr/bin/python && \
ln /usr/bin/python3.8 /usr/bin/python3 && \
python3 get-pip.py && \
wget $CHROME_DRIVER_URL && \
unzip chromedriver_linux64.zip && \
mv chromedriver /usr/local/bin/. && \
rm -f chromedriver_linux64.zip && \
rm -f get-pip.py && \
apt-get install -y language-pack-ja-base language-pack-ja && \
locale-gen ja_JP.UTF-8

# Pythonライブラリインストール
RUN pip install --upgrade pip

RUN pip install -r requirements.txt
