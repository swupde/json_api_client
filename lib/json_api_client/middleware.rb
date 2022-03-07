module JsonApiClient
  module Middleware
    autoload :JsonRequest, 'json_api_client/middleware/json_request'
    autoload :Gzip, 'json_api_client/middleware/gzip'
    autoload :Status, 'json_api_client/middleware/status'
  end
end