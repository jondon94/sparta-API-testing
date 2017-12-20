require 'spec_helper'

describe 'fixer' do

  before(:each) do
    @file = JSON.parse(HTTParty::get('http://api.fixer.io/latest').body)
  end

  it 'Should be a Hash' do
    expect(@file).to be_kind_of(Hash)
  end

  it "should contain the base as EUR" do
    expect(@file["base"]).to eq "EUR"
  end

  it "Should have a date string" do
    expect(@file["date"]).to be_kind_of(String)
  end


  it "should countain 31 rates" do
    @key_num = 0
    @value_num = 0

    @file["rates"].each do |k,v|
      @key_num += 1
      @value_num += 1
    end

    expect(@key_num).to eq 31
    expect(@value_num).to eq 31
  end

  it "should all rates should be Floats" do
    @file["rates"].each do |k,v|
      expect(v).to be_kind_of(Float)
    end
  end

end

# require 'spec_helper'
#
# # describe ExchngRts do
# #
# #   before(:each) do
# #     # link pages together for tests
# #     # @exchngrts = ExchngRts.new
# #   end
# #
# # end
#
# describe 'ParseJson' do
#   before(:each) do
#     @file = JSON.parse(HTTParty::get('http://api.fixer.io/latest').body)
#   end
#
#   it 'should be a hash' do
#     # Expect the values to be in a hash format
#     expect(@exchange_rates.json_file).to be_kind_of(Hash)
#   end
#
#     it 'should return Euro as the base currency' do
#       # Test for base currency is Euro
#       # expect(@exchange_rates.json_file.['base']).to eq('EUR')
#       expect(@exchange_rates.get_base_value).to eq('EUR')
#     end
#
#     it 'should show todays date for current exchange rate' do
#       # Test for correct date shown i.e. probably todays date but will pass existing date for test
#       expect(@exchange_rates.get_date_value).to eq('2017-07-26')
#     end
#
#     it 'should return a true of false value on whether the correct number of currencies is listed' do
#       # Tests for the correct number of currencies listed
#       expect(@exchange_rates.get_rates.count).to eq(31)
#     end
#
#     it 'should show that no exchange rate has a negative value, only positive numbers' do
#       # No negative value of exchange rate
#       expect(@exchange_rates.get_rates.values).to be(greater_than 0)
#     end
#
# end
