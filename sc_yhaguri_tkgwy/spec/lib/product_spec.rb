describe Product do
  let(:word_product) { Product.new(name: 'MS Word', type: 'W', price: 18800) }
  let(:excel_product) { Product.new(name: 'MS Excel', type: 'S', price: 27800) }

  describe "名前" do
    it "nameとしてMS Wordを設定したときに、nameとしてMS Wordが取得できること" do
      expect(word_product.name).to eq 'MS Word'
    end

    it "nameとしてMS Excelを設定したときに、nameとしてMS Excelが取得できること" do
      expect(excel_product.name).to eq 'MS Excel'
    end
  end

  describe "タイプ" do
    it "typeとしてWを設定したときに、typeとしてWが取得できること" do
      expect(word_product.type).to eq 'W'
    end
    
    it "typeとしてSを設定したときに、typeとしてSが取得できること" do
      expect(excel_product.type).to eq 'S'
    end
  end

  describe "価格" do
    it "priceとして1880を設定したときに、priceとして18800が取得できること" do
      expect(word_product.price).to eq 18800
    end
  end
end
