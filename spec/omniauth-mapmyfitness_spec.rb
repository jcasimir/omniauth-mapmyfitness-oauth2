require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "OmniauthMapmyfitness" do
  subject do
    OmniAuth::Strategies::MapMyFitness.new({})
  end

  it 'has a name' do
    subject.options.name.should be
  end

  [:access_token_path, :authorize_path, :http_method,
   :request_token_path, :scheme, :site].each do |attribute|

    it "has the #{attribute} defined" do
      subject.options.client_options.send(attribute).should be
    end
  end

end
