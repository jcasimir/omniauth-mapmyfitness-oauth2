require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "OmniauthMapmyfitness" do
  let(:auth) do
    OmniAuth::Strategies::MapMyFitness.new({})
  end

  it 'has a name' do
    expect(auth.options.name).to be
  end

  [:access_token_path, :authorize_path, :http_method,
   :request_token_path, :scheme, :site].each do |attribute|

    it "has the #{attribute} defined" do
      expect(auth.options.client_options.send(attribute)).to be
    end
  end

end
