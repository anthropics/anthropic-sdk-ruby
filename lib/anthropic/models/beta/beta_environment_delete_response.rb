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
        #   @return [Symbol, :environment_deleted]
        required :type, const: :environment_deleted

        # @!method initialize(id:, type: :environment_deleted)
        #   Response after deleting an environment.
        #
        #   @param id [String] Environment identifier
        #
        #   @param type [Symbol, :environment_deleted] The type of response
      end
    end

    BetaEnvironmentDeleteResponse = Beta::BetaEnvironmentDeleteResponse
  end
end
