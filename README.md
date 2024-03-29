# アプリケーション名
聖地巡礼史 


# アプリケーション概要
漫画やアニメ、ドラマ等の聖地を共有することで、漫画等を好きな人が聖地を訪れることができます。<br>また、聖地がある場所も観光客が多く訪れることで、地域の活性化につながることができます。


# URL
https://seichi1205-39574.onrender.com


# テスト用アカウント
アカウント<br>
Eメール: test@outlook.jp<br>
パスワード: a123456<br>

Basic認証<br>
ID: iruka<br>
password: 1129


# 利用方法
アプリ利用者が投稿した聖地を確認することができます。<br>
検索フォームを使えば、都道府県やカテゴリー、作品名などで調べることができます。<br>
ユーザーの新規登録を行えば、聖地の投稿を行うことができます。<br>
お気に入り機能があるため、気になる聖地をお気に入り登録すれば、後からすぐに確認できます。


# アプリケーションを作成した背景
職場の同僚にヒアリングし、「地元にもう少し観光客が来て賑やかになってほしい」という課題を抱えていました。課題を分析した結果、「観光客が行きたいと思う観光スポットがない」ということが原因であると仮説を立てました。ほかの同僚と話していると、「ドラマの撮影場所に選ばれてから観光客が増えて賑やかになっている」ということを聞きました。更に調べてみると人知れずドラマや映画の撮影場所になっていたり、アニメや漫画の舞台となっている場所が多く存在していることを知りました。このような場所を多くの人に知ってもらえると、知った人は行ってみたいと思いますし、来てもらった地元の方には喜んでいただけると考えています。このような経緯で聖地巡礼ができるアプリケーションを開発することとしました。


# 洗い出した要件
https://docs.google.com/spreadsheets/d/1wUO91cHNPPsJqfudkRIaTWHNiMb6HMaomUh4lAJeziU/edit#gid=982722306


# 実装した機能についての画像やGIF及びその説明
[![Image from Gyazo](https://i.gyazo.com/2082e04168f95511a123b71e16147de3.gif)](https://gyazo.com/2082e04168f95511a123b71e16147de3)<br>
聖地を投稿する際にグーグルマップで地点をクリックすることで緯度及び経度が登録されます。<br>

[![Image from Gyazo](https://i.gyazo.com/2fdcc9f270a804d439782e1d53c93b11.gif)](https://gyazo.com/2fdcc9f270a804d439782e1d53c93b11)<br>
聖地詳細ページにあるグーグルマップで場所を確認できます。

# 実装予定の機能
今後は地図を使って聖地を検索できるようにするつもりです。


# データベース設計
[![Image from Gyazo](https://i.gyazo.com/b8523c1ef0cbfa21f2c510f53cc6fed7.png)](https://gyazo.com/b8523c1ef0cbfa21f2c510f53cc6fed7)


# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/42d1356f94bec3fdb8686b4198f8f796.png)](https://gyazo.com/42d1356f94bec3fdb8686b4198f8f796)


# 開発環境
・ フロントエンド<br>
     HTML,CSS,JavaScript<br>
・ バックエンド<br>
     Ruby,Ruby on Rails<br>
・ インフラ<br>
     Windows,Ubuntu<br>
・ テキストエディタ<br>
     Visual Studio Code<br>
・ タスク管理<br>
     Git, GitHub


# ローカルでの作動方法
以下のコマンドを順に実行<br>
% git clone https://github.com/D0lph1n25/seichi1205.git<br>
% cd D0lph1n25/seichi1205.git<br>
% bundle install<br>
% yarn install


# 工夫したポイント
GoogleMapsAPIを使用し、地図をクリックして地点を登録できるようにしました。<br>
ボタンに色を付けて直感的に操作できるようにしました。また、役割ごとにボタンの色を変えてわかりやすくしました。
