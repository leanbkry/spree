module Spree
  class ApiConfiguration < Preferences::Configuration
    preference :requires_authentication, :boolean, default: true
    preference :disable_v1_routes, :boolean, default: false
    preference :api_v2_content_type, :string, default: 'application/vnd.api+json'
  end
end
