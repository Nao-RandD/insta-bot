## insta-bot

### develop
buranch -> maru(開発中)
### usage

main.py 17,19行目は適宜書き換え

~~~
// terminal 1
% docker build .(長いのでdemo省略)
% docker-compose up
// output↓
~~~
|  Name  |  Command  |  State  |  Ports  |
| ---- | ---- | ---- | ---- |
|  instabot  |  bash  |  Up  |    |
    
~~~ 
// terminal 2
% docker-compose ps
// output↑
% docker exec -it instabot bash
% python main.py
% exit
%docker-compose down
~~~
実行結果はinsta.txtへ出力