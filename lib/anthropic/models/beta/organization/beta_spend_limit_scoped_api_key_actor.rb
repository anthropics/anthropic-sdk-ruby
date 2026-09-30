# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaSpendLimitScopedAPIKeyActor < Anthropic::Internal::Type::BaseModel
          # @!attribute scoped_api_key_id
          #
          #   @return [String]
          required :scoped_api_key_id, String

          # @!attribute type
          #
          #   @return [Symbol, :scoped_api_key_actor]
          required :type, const: :scoped_api_key_actor

          # @!method initialize(scoped_api_key_id:, type: :scoped_api_key_actor)
          #   A scoped Admin API key acting on behalf of the organization.
          #
          #   @param scoped_api_key_id [String]
          #   @param type [Symbol, :scoped_api_key_actor]
        end
      end
    end
  end
end
