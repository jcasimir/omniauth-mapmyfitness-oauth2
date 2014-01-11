module OmniAuth
  module MapMyFitness
    class User
      def self.data_attributes
        ["username", "first_name", "last_name", "display_name", "last_initial", 
         "weight", "communication", "display_measurement_system", "time_zone", 
         "birthdate", "height", "email", "sharing", "last_login", "location", 
         "gender", "_links", "id", "date_joined"]
      end

      attr_reader :data, :token_expires_at, :token_refresh, :token
      attr_reader *data_attributes

      def initialize(auth_info)
        @data = auth_info
        parse_attributes
      end

      def parse_attributes
        User.data_attributes.each do |attribute|
          instance_variable_set("@#{attribute}", data["info"][attribute])
        end
        @token_expires = data["credentials"]["expires"]
        @token_expires_at = data["credentials"]["expires_at"]
        @token_refresh = data["credentials"]["refresh_token"]
        @token = data["credentials"]["token"]
      end
    end
  end
end