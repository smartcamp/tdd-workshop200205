require 'date'

describe Contract do
  let(:price) { 18800 }
  let(:word_processor) { WordProcessor.new(name: 'MS Word', price: price) }
  let(:spread_sheet) { SpreadSheet.new(name: 'MS Excel', price: price) }
  let(:signed_on) { Date.new(2020, 1, 1) }
  let(:contract) { Contract.new(signed_on: signed_on, product: product) } 

  describe '#signed_on' do
    let(:product){ word_processor }
    it 'インスタンス化したときのsigned_onを返す' do
      expect(contract.signed_on).to eq signed_on
    end
  end

  describe '#product' do
    let(:product){ word_processor }
    it 'インスタンス化したときのproductを返す' do
      expect(contract.product).to eq word_processor
    end
  end

  describe '#revenue' do
    let(:product){ word_processor }
    it 'productのpriceと同じ金額を返す' do
      expect(contract.revenue).to eq word_processor.price
    end
  end

  describe '#recognized_revenue' do
    context 'productがWordProcessorのとき' do
      let(:product){ word_processor }
      context '売上以降のとき' do
        it '売上当日は全額計上される' do
          expect(contract.recognized_revenue(signed_on)).to eq price
        end
      end
    end

    context 'productがSpreadSheetのとき' do
      let(:product){ spread_sheet }

      context '売上当日以降で60日より前のとき' do
        it '売上当日は2/3計上される' do
          expect(contract.recognized_revenue(signed_on)).to eq (price * 2/3r).floor
        end
      end

      context '売上60日以降のとき' do
        it '売上60日後は全額計上される' do
          expect(contract.recognized_revenue(signed_on + 60)).to eq price
        end
      end
    end
  end
end
