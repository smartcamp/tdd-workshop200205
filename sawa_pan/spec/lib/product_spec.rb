require 'rspec'

describe Product do
  it 'クラスメソッドtypeを持つ' do
    expect(Product).to respond_to :type
  end

  describe '.revenue_portions' do
    it do
      expect(Product).to respond_to :revenue_portions
    end
  end

  describe '#name' do
    it 'インスタンス化したときのnameを返す' do
      # 準備
      name = 'name'
      product = Product.new(name: name, price: 1000)
      # 実行 & 検査
      expect(product.name).to eq name
    end
  end

  describe '#price' do
    it 'インスタンス化したときのpriceを返す' do
      # 準備
      price = 1000
      product = Product.new(name: 'name', price: price)
      # 実行 & 検査
      expect(product.price).to eq price
    end
  end
end

describe WordProcessor do
  describe '.type' do
    it '\'W\'を返す' do
      expect(WordProcessor.type).to eq('W')
    end
  end

  describe '.revenue_portions' do
    it do
      expect(WordProcessor.revenue_portions).to eq [{days_after: 0, portion: 1r}]
    end
  end
end

describe SpreadSheet do
  describe '.type' do
    it '\'S\'を返す' do
      expect(SpreadSheet.type).to eq('S')
    end
  end

  describe '.revenue_portions' do
    it do
      expect(SpreadSheet.revenue_portions).to eq [
        {days_after: 0, portion: 2/3r},
        {days_after: 60, portion: 1/3r}
      ]
    end
  end
end

describe Database do
  describe '.type' do
    it '\'D\'を返す' do
      expect(Database.type).to eq('D')
    end
  end

  describe '.revenue_portions' do
    it do
      expect(Database.revenue_portions).to eq [
        {days_after: 0, portion: 1/3r},
        {days_after: 60, portion: 1/3r},
        {days_after: 120, portion: 1/3r}
      ]
    end
  end
end
