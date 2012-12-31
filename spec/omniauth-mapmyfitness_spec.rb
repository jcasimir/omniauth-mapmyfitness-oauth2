require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "OmniauthMapmyfitness" do
  subject do
    OmniAuth::Strategies::MapMyFitness.new({})
  end

  it 'should have the correct name' do
    subject.options.name.should eq('mapmyfitness')
  end

  it 'should have the correct access token path' do
    subject.options.client_options.access_token_path.should eq('/3.1/oauth/access_token')
  end

  it 'should have the correct authorize path' do
    subject.options.client_options.authorize_path.should eq('/3.1/oauth/authorize')
  end

  it 'should have the correct http method' do
    subject.options.client_options.http_method.should eq(:get)
  end

  it 'should have the correct request token path' do
    subject.options.client_options.request_token_path.should eq('/3.1/oauth/request_token')
  end

  it 'should have the correct scheme' do
    subject.options.client_options.scheme.should eq(:query_string)
  end

  it 'should have the correct site' do
    subject.options.client_options.site.should eq("https://api.mapmyfitness.com")
  end
end
