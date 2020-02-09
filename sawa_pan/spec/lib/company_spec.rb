require 'date'

describe Company do
  let(:company) { Company.new }

  describe '#contracts' do
    it 'インスタンス化したときのcontractsを返す' do
      expect(company.contracts).to eq []
    end
  end

  describe '#make_contracts' do
    let(:signed_on){Date.new(2020, 1, 1)}
    let(:product){WordProcessor.new(name: 'MS Word', price: 18800)}
    let(:contract1){Contract.new(signed_on: signed_on, product: product)}
    let(:contract2){Contract.new(signed_on: signed_on, product: product)}

    context 'contractsに引数のcontractを追加する' do
      before do
        company.make_contracts(contract1)
      end
  
      it do
        expect(company.contracts).to eq [contract1]
      end
    end

    context 'contractsに引数のcontractを複数追加する' do
      before do
        company.make_contracts(contract1, contract2)
      end
  
      it do
        expect(company.contracts).to eq [contract1, contract2]
      end
    end
  end

  describe '#gross_revevue' do
    let(:signed_on){Date.new(2020, 1, 1)}
    let(:price) { 18800 }
    let(:product){WordProcessor.new(name: 'MS Word', price: price)}
    let(:contract1){Contract.new(signed_on: signed_on, product: product)}

    context 'contractが一つのとき' do
      before do
        company.make_contracts(contract1)
      end
      context '締結日よりまえ' do
        it 'その日まで売上高を返す' do
          expect(company.gross_revenue(signed_on)).to eq price
        end
      end
    end

    context '本日まで売上高ゼロのところから本日 MS Excel、 MS SQL Server がひとつずつ、 5日後に MS Word と MS Excel がひとつずつ売れる契約が成立したとき' do
      let(:today){Date.new(2020, 2, 5)}
      let(:spread_sheet){SpreadSheet.new(name: 'MS Excel', price: 27800)}
      let(:database){Database.new(name: 'MS SQL Server', price: 919000)}
      let(:word_processor){WordProcessor.new('MS Word', price: 18800)}
      let(:contract1){Contract.new(singned_on: today, product: spread_sheet)}
      let(:contract2){Contract.new(singned_on: today, product: database)}
      let(:contract3){Contract.new(singned_on: today + 5, product: spread_sheet)}
      let(:contract4){Contract.new(singned_on: today + 5, product: word_processor)}
      before do
        company.make_contracts(contract1, contract2, contract3, contract4)
      end
      context '本日の売上高' do
        expect(company.gross_revenue(today)).to eq 0
      end
      context '30日後の売上高' do
      end
      context '60日後の売上高' do
      end
    end
  end
end