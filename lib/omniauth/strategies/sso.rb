require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Sso < OmniAuth::Strategies::OAuth2
      option :name, 'sso'

      option :client_options, {
        site: ENV['SSO_PROVIDER_URL'],
        authorize_url: "#{ENV['SSO_PROVIDER_URL']}/auth/sso/authorize",
        access_token_url: "#{ENV['SSO_PROVIDER_URL']}/auth/sso/access_token"
      }

      uid { raw_info['id'] }

      info do
        {
          email: raw_info['email']
        }
      end

      extra do
        {
          name: raw_info['extra']['name'],
          gender: raw_info['extra']['gender'],
          age: raw_info['extra']['age']
        }
      end

      def raw_info
        @raw_info ||= access_token
                      .get("/auth/sso/user.json?oauth_token=#{access_token.token}")
                      .parsed
      end
    end
  end
end
