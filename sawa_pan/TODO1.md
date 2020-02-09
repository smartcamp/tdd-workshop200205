以下の3つのタイプの製品(product)を売る会社を考える

ワードプロセッサ
スプレッドシート
データベース
製品は名前(name)、タイプ(type)、価格(price)を持つ

例:

MS Word の価格は18,800円、タイプは 'W'
MS Excel の価格は 27,800円、タイプは 'S'
MS SQL Server の価格は 919,000円、タイプは 'D'

- [x] Productクラスを作る
  - [x] Productはクラスメソッドtypeを持つ
  - [x] Productクラスはname, priceを引数としてインスタンス化できる
  - [x] Productクラスのインスタンスはname, priceにアクセスできる
    - [x] Productクラスをインスタンス化したときのname, priceを返す
  - [ ] nameが主キー
  - [x] revenue_recognitionは{◯日後: 収益認識額}の配列
- [x] ProductのサブクラスとしてWordProcessor, SpreadSheet, Databaseクラスがある
  - [x] サブクラスを作るときにtypeを指定する
    - [x] WordProcessorは'W'
    - [x] SpreadSheetは'S'
    - [x] Databaseは'D'
- [x] Contractクラスを作る
  - [x] singned_on(契約日)を持つ
  - [x] Productを1つ持つ
  - [x] revenueはProductのprice
  - [x] recognized_revenueは日付を引数にその日までの収益認識額の総額を返す
- [x] Companyクラスを作る
  - [x] インスタンスはContractインスタンスの配列を持つ
  - [x] make_contractメソッドがcontractsにContractインスタンスを追加する
  - [ ] make_contractメソッドがcontractsに複数Contractインスタンスを追加する
  - [x] gross_revenueメソッドは特定の日付における売上高(粗収益: gross revenue)を与える

