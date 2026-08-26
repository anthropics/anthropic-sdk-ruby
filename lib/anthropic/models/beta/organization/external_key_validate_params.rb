# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::ExternalKeys#validate
        class ExternalKeyValidateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute external_key_id
          #   ID of the External Key.
          #
          #   @return [String]
          required :external_key_id, String

          # @!method initialize(external_key_id:, request_options: {})
          #   @param external_key_id [String] ID of the External Key.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
