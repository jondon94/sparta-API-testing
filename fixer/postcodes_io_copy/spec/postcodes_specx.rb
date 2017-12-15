require 'spec_helper'

describe 'postcodes_io_copy' do

  before(:each) do
    @pcode = Postcodesio.new
  end

  a = 'ch49pf'
  b = ['ch49pf', 'sy233th']

  it "should return the information as a hash" do
    expect(@pcode.get_multiple_postcodes(b)).to be_kind_of(Hash)
  end

  it "should have status code of 200 for a successful request" do
    expect(@pcode.get_multiple_postcodes(b)['status']).to eq(200)
  end

  it "should have 23 individual results for each postcode" do
    @pcode.get_multiple_postcodes(b)['result'].each do |result|
      # puts result['result'].length
      expect(result['result'].length).to eq(23)
    end
    # puts @pcode.get_multiple_postcodes(b)['result'][0]
  end

  # it "should have 23 individual results for a single postcode" do
  #   expect(@pcode.get_single_postcode(a)['result'].length).to eq(23)
  # end

  it "should show the postcode as the first result" do
    expect(@pcode.get_single_postcode(a)['result'].first[1]).to eq 'CH4 9PF'
  end

  it "should have a value as in integer for the quality param" do
    expect(@pcode.get_single_postcode(a)['result']['quality']).to be_kind_of(Integer)
  end

  it "should have a vaule less than 10 for the quality param" do
    expect(@pcode.get_single_postcode(a)['result']['quality'].to_i).to be < 10
  end

  it "should have a vaule greater than 0 for the quality param" do
    expect(@pcode.get_single_postcode(a)['result']['quality'].to_i).to be > 0
  end

  it "should have a value as in integer for the eastings param" do
    expect(@pcode.get_single_postcode(a)['result']['eastings']).to be_kind_of(Integer)
  end

  it "should have a value as in integer for the northings param" do
    expect(@pcode.get_single_postcode(a)['result']['northings']).to be_kind_of(Integer)
  end

  it "should have a string for specifiying the country" do
    expect(@pcode.get_single_postcode(a)['result']['country']).to be_kind_of(String)
  end

  it "should belong to a post code within 1 of the 4 countries of the uk" do
    expect(@pcode.get_single_postcode(a)['result']['country']).to include ('Wales' || 'England' || 'Scotland' || 'Northern Ireland')
  end

  it "should have a string for specifiying the local health board" do
    expect(@pcode.get_single_postcode(a)['result']['nhs_ha']).to be_kind_of(String)
  end

  it "should have a value as in integer for the longitude param" do
    expect(@pcode.get_single_postcode(a)['result']['longitude']).to be_kind_of(Float)
  end

  it "should have a value as in integer for the latitude param" do
    expect(@pcode.get_single_postcode(a)['result']['latitude']).to be_kind_of(Float)
  end

  it "should have a string for specifiying the european electoral reigon" do
    expect(@pcode.get_single_postcode(a)['result']['european_electoral_region']).to be_kind_of(String)
  end

  it "should have a string for specifiying the primary health board" do
    expect(@pcode.get_single_postcode(a)['result']['primary_care_trust']).to be_kind_of(String)
  end

  it "should have a null value for the reigon as this param was abolished in 2011" do
    expect(@pcode.get_single_postcode(a)['result']['region']).to eq nil
  end

  it "should have a lsoa that is a string that conatins numbers (ie. string)" do
    expect(@pcode.get_single_postcode(a)['result']['lsoa']).to be_kind_of(String)
  end

  it "should have a msoa that is a string that conatins numbers (ie. string)" do
    expect(@pcode.get_single_postcode(a)['result']['msoa']).to be_kind_of(String)
  end

  # it "should have 23 individual results for each postcode" do
  #   @pcode.get_multiple_postcodes(b)['result'].each do |result|
  #     # puts result['result'].length
  #     expect(result['result'].length).to eq(23)
  #   end
  #   # puts @pcode.get_multiple_postcodes(b)['result'][0]
  # end
  it "should have 7 individual code results for each postcode" do
    @pcode.get_multiple_postcodes(b)['result']['codes'].each do |codes|
      puts codes['result']['codes'].length
      # expect(codes['result']['codes'].length).to eq(7)
    end
    # puts @pcode.get_multiple_postcodes(b)['result']['codes']
  end

  it "should have a code hash-key that contains 7 keys" do
    expect(@pcode.get_single_postcode(a)['result']['codes'].length).to eq(7)
  end

  it "should have codes that contain strings" do
    expect(@pcode.get_single_postcode(a)['result']['codes']['admin_district']).to be_kind_of(String)
  end

end
