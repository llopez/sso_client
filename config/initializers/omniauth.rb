APP_ID = 'YE0NYveQGoFsNLX220Dy5g'
APP_SECRET = 'aqpGBedDnHFyp5MmgT8KErr9D015ScmaY8r3vHg5C0'

CUSTOM_PROVIDER_URL = 'http://localhost:3001'

require 'omniauth/strategies/sso'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :sso, APP_ID, APP_SECRET
end
