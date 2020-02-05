require "date"
describe Company do
  let(:today) { Date.today }
  let(:word_product) { Product.new(name: 'MS Word', type: 'W', price: 18_800) }
  let(:word_contract) { Contract.new(product: word_product, signed_on: today) }
  let(:excel_product) { Product.new(name: 'MS Excel', type: 'S', price: 27_800) }
  let(:excel_contract) { Contract.new(product: excel_product, signed_on: today) }
  let(:db_contract) { Contract.new(product: db_product, signed_on: today) }
  let(:db_product) { Product.new(name: 'MS SQL Server', type: 'D', price: 919_000) }

  context "ワードプロセッサ、スプレッドシート、データベースが同日に1つずつ契約" do
    it "今日の売上高が全商品の当日の収益認識の合計になる" do
      company = Company.new
      company.contracts = [word_contract, excel_contract, db_contract]
      summary = word_contract.revenue(today) + excel_contract.revenue(today) + db_contract.revenue(today)
      expect(company.gross_revenue(today)).to eq summary
    end
  end
end
