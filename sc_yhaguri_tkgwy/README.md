## TDD ワークショップ

### TODOリスト
- [x] 製品
  - [x] 名前
    - [x] nameとしてMS Wordを設定したときに、nameとしてMS Wordが取得できること
    - [x] nameとしてMS Excelを設定したときに、nameとしてMS Excelが取得できること
  - [x] タイプ
    - [x] typeとしてWを設定したときに、typeとしてWが取得できること
  - [x] 価格
    - [x] priceとして1880を設定したときに、typeとして18800が取得できること


- [x] 契約
  - 当日
    - [x] ワードプロセッサは、売上のすべてが収益認識になる
    - [x] スプレッドシートは、売上の2/3が収益認識になる
    - [x] データベースは、売上の1/3が収益認識になる

  - 29日後
    - [x] スプレッドシートは、契約当日と同じ収益認識になる

  - 30日後
    - [x] スプレッドシートは、売上のすべてが収益認識になる

  - 59日後
    - [x] データベースは、契約当日と同じ収益認識になる

  - 60日後
    - [x] データベースは、売上の2/3が収益認識になる

  - 119日後
    - [x] データベースは、60日後と同じ収益認識になる

  - 120日後
    - [x] データベースは、売上のすべてが収益認識になる

- [x] 会社
  - [x] 全商品が同日に契約したときの、今日の売上高が全商品の当日の収益認識の合計になる

#### 問題1: 製品と価格


#### 問題2: 契約,売上,収益認識
- 契約（Contract）
- 契約日（signed_on）
- 売上（Revenue）
- 収益認識（revenue recognition）


現時点ではどれか1つの製品を1つのみ購入の契約ができる。

契約(contract)が成立した場合、





ワードプロセッサは契約日(signed_on または signedDate)に直ちに売上(revenue)を収益認識(revenue recognition)する。
スプレッドシートは（30日間の返品を受け付けるので ←ここは実装不要です）契約日に売上の2/3、30日後に1/3を収益認識する。
データベースは（120日間のサポートを行うので ←ここは実装不要です）契約日に売上の1/3、60日後に1/3、120日後にまた1/3を収益認識する。
このとき、特定の日付における売上高(粗収益: gross revenue)を計算したい。

例: 本日まで売上高ゼロのところから本日 MS Excel、 MS SQL Server がひとつずつ、 5日後に MS Word と MS Excel がひとつずつ売れる契約が成立したときの 本日、30日後、60日後の売上高

