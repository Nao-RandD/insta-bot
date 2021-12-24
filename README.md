## insta-bot

###usage

~~~
% docker build .(長いのでdemo省略)
% docker-compose up
% docker-compose ps
// output↓
~~~
|  Name  |  Command  |  State  |  Ports  |
| ---- | ---- | ---- | ---- |
|  instabot  |  bash  |  Up  |    |
    
~~~ 
% docker exec -it instabot bash
% python main.py
~~~
実行結果はinsta.txtへ出力