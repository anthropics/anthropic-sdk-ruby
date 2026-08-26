# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::APIKeys#retrieve
        class APIKeyRetrieveParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute api_key_id
          #   ID of the API key.
          #
          #   @return [String]
          required :api_key_id, String

          # @!method initialize(api_key_id:, request_options: {})
          #   @param api_key_id [String] ID of the API key.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
