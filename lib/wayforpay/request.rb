require 'json'
require 'net/http'

module Wayforpay
  class Request
    def self.call(encrypted_fields = [], request_params = {})
      request_params[:merchantSignature] = EncryptField.(encrypted_fields, request_params)
      Net::HTTP.post(Constants::URL, request_params.to_json)
    end
  end

  class SecureRequest
    def self.call(encrypted_fields = [], request_params = {})
      request_params[:merchantSignature] = EncryptField.(encrypted_fields, request_params)
      puts "WFP params #{request_params.to_json}"
      Net::HTTP.post(Constants::VERIFY_URL, request_params.to_json)
    end
  end
end
