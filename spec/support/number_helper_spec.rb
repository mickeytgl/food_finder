# encoding: UTF-8

describe 'NumberHelper' do

  include NumberHelper
  
  describe '#number_to_currency' do
    
    context 'using default values' do
      
      it "correctly formats an integer" do 
        num = 2000
        expect(number_to_currency(num)).to eq('$2,000.00')
      end
      
      it "correctly formats a float" do 
        num = 2000.50
        expect(number_to_currency(num)).to eq('$2,000.50')
      end

      it "correctly formats a string" do 
        expect(number_to_currency('2000')).to eq('$2,000.00')
      end
      
      it "uses delimiters for very large numbers" do 
        expect(number_to_currency(2000)).to eq('$2,000.00')
      end

      it "does not have delimiters for small numbers" do
        expect(number_to_currency(2)).to eq('$2.00')
      end

    end
    
    context 'using custom options' do
      
      it 'allows changing the :unit' do 
        expect(number_to_currency(200, { :unit => '€'})).to eq('€200.00')
      end

      it 'allows changing the :precision' do 
        expect(number_to_currency(200, { :precision => 3})).to eq('$200.000')
      end
      
      it 'omits the separator if :precision is 0' do 
        expect(number_to_currency(200, { :precision => 0})).to eq('$200')
      end
      
      it 'allows changing the :delimiter' do 
        expect(number_to_currency(2000, { :delimiter => ',,'})).to eq('$2,,000.00')
      end
      
      it 'allows changing the :separator' do
        expect(number_to_currency(200, { :separator => '..'})).to eq('$200..00')
      end
            
      it 'correctly formats using multiple options' do 
        expect(number_to_currency(2000, {
          :unit => '€',
          :precision => 0,
          :delimiter => '@'
          })).to eq('€2@000')
      end
      
    end
    
  end
  
end
