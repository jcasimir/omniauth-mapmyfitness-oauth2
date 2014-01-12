require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class MapMyFitness < OmniAuth::Strategies::OAuth2
      option :name, "mapmyfitness"

      option :client_options, {
        :site => "https://oauth2-api.mapmyapi.com",
        :authorize_url => "https://www.mapmyfitness.com/v7.0/oauth2/authorize/",
        :token_url => "https://oauth2-api.mapmyapi.com/v7.0/oauth2/access_token/",
        :connection_opts => {
          :headers => {'Api-Key' => ENV['MMF_API_KEY']}
        }
      }

      option :token_options, { :grant_type => 'authorization_code' }

      uid{ raw_info['user_id'] }

      info{ raw_info }

      def raw_info
        @raw_info ||= JSON.parse(access_token.get("/v7.0/user/self").body)
      end
    end
  end
end

OmniAuth.config.add_camelization 'mapmyfitness', 'MapMyFitness'