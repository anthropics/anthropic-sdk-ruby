# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Environments#delete
      class BetaEnvironmentDeleteResponse < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   Environment identifier
        #
        #   @return [String]
        required :id, String

        # @!attribute type
        #   The type of response
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaEnvironmentDeleteResponse::Type]
        required :type, enum: -> { Anthropic::Beta::BetaEnvironmentDeleteResponse::Type }

        # @!method initialize(id:, type:)
        #   Response after deleting an environment.
        #
        #   @param id [String] Environment identifier
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaEnvironmentDeleteResponse::Type] The type of response

        # The type of response
        #
        # @see Anthropic::Models::Beta::BetaEnvironmentDeleteResponse#type
        module Type
          extend Anthropic::Internal::Type::Enum

          ENVIRONMENT_DELETED = :environment_deleted

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaEnvironmentDeleteResponse = Beta::BetaEnvironmentDeleteResponse
  end
end
