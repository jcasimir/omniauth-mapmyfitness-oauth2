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

      option :token_options, {
        :grant_type => 'authorization_code',
      }

      uid {
        raw_info['user_id']
      }

      info do
        {
          :name => "#{raw_info['first_name']} #{raw_info['last_name']}",
          :email => raw_info['email'],
          :nickname => raw_info['username'],
          :first_name => raw_info['first_name'],
          :last_name => raw_info['last_name'],
          :location => [raw_info['start_city'], raw_info['start_state'], raw_info['start_country']].join(', '),
          #:image => "http://api.mapmyfitness.com/3.1/users/get_avatar?uid=#{raw_info['user_id']}",
          :urls => {:mapmyfitness => "http://www.mapmyfitness.com/profile/#{raw_info['username']}"}
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info = JSON.parse(access_token.get("/v7.0/user/self").body)
      end
    end
  end
end

OmniAuth.config.add_camelization 'mapmyfitness', 'MapMyFitness'