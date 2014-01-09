require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "OmniauthMapmyfitness" do
  let(:auth) do
    OmniAuth::Strategies::MapMyFitness.new({})
  end

  it 'has a name' do
    auth.options.name.should be
  end

  [:access_token_path, :authorize_path, :http_method,
   :request_token_path, :scheme, :site].each do |attribute|

    it "has the #{attribute} defined" do
      auth.options.client_options.send(attribute).should be
    end
  end

end
