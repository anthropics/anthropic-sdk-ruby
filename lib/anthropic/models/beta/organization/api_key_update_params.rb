# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::APIKeys#update
        class APIKeyUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute api_key_id
          #   ID of the API key.
          #
          #   @return [String]
          required :api_key_id, String

          # @!attribute name
          #   Name of the API key.
          #
          #   @return [String, nil]
          optional :name, String, nil?: true

          # @!attribute status
          #   Status of the API key.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::APIKeyUpdateParams::Status, nil]
          optional :status, enum: -> { Anthropic::Beta::Organization::APIKeyUpdateParams::Status }, nil?: true

          # @!method initialize(api_key_id:, name: nil, status: nil, request_options: {})
          #   @param api_key_id [String] ID of the API key.
          #
          #   @param name [String, nil] Name of the API key.
          #
          #   @param status [Symbol, Anthropic::Models::Beta::Organization::APIKeyUpdateParams::Status, nil] Status of the API key.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

          # Status of the API key.
          module Status
            extend Anthropic::Internal::Type::Enum

            ACTIVE = :active
            ARCHIVED = :archived
            INACTIVE = :inactive

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
