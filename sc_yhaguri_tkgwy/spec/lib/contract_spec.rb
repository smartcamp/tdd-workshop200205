require "date"
describe Contract do
  let(:today) { Date.today }
  let(:word_product) { Product.new(name: 'MS Word', type: 'W', price: 18_800) }
  let(:word_contract) { Contract.new(product: word_product, signed_on: today) }
  let(:excel_product) { Product.new(name: 'MS Excel', type: 'S', price: 27_800) }
  let(:excel_contract) { Contract.new(product: excel_product, signed_on: today) }
  let(:db_product) { Product.new(name: 'MS SQL Server', type: 'D', price: 919_000) }
  let(:db_contract) { Contract.new(product: db_product, signed_on: today) }

  context "契約当日(0日後)" do
    let(:date) { today }
    describe "ワードプロセッサ" do
      it "当日だと、契約製品の価格のすべてが収益認識になる" do
        expect(word_contract.revenue(date)).to eq word_product.price
      end
    end

    describe "スプレッドシート" do
      it "当日だと、契約製品の価格の2/3が収益認識になる" do
        expect(excel_contract.revenue(date)).to eq excel_product.price / 3 * 2
      end
    end

    describe "データベース" do
      it "当日だと、契約製品の価格の1/3が収益認識になる" do
        expect(db_contract.revenue(date)).to eq db_product.price / 3 * 1
      end
    end
  end

  context "契約30日後" do
    let(:date) { today.next_day(30) }
    describe "スプレッドシート" do
      it "当日だと、契約製品の価格のすべてが収益認識になる" do
        expect(excel_contract.revenue(date)).to eq excel_product.price
      end

      it "前日だと、契約製品の価格が契約当日と同じ収益認識になる" do
        expect(excel_contract.revenue(date.prev_day(1))).to eq excel_contract.revenue(today)
      end
    end
  end

  context "契約60日後" do
    let(:date) { today.next_day(60) }
    describe "データベース" do
      it "当日だと、契約製品の価格が2/3が収益認識になる" do
        expect(db_contract.revenue(date)).to eq db_product.price / 3 * 2
      end

      it "前日だと、契約製品の価格が契約当日と同じ収益認識になる" do
        expect(db_contract.revenue(date.prev_day(1))).to eq db_contract.revenue(today)
      end
    end
  end

  context "契約120日後" do
    let(:date) { today.next_day(120) }
    describe "データベース" do
      it "当日だと、契約製品の価格のすべてが収益認識になる" do
        expect(db_contract.revenue(date)).to eq db_product.price
      end

      it "前日だと、契約製品の価格が契約60日後と同じ収益認識になる" do
        expect(db_contract.revenue(date.prev_day(1))).to eq db_contract.revenue(today.next_day(60))
      end
    end
  end
end
