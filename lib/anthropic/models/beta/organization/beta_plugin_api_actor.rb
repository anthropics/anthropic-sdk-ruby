# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPluginAPIActor < Anthropic::Internal::Type::BaseModel
          # @!attribute api_key_id
          #   The key's ID.
          #
          #   @return [String]
          required :api_key_id, String

          # @!attribute type
          #   An Admin API key, in the same form the Compliance API activity feed uses for it.
          #
          #   @return [Symbol, :api_actor]
          required :type, const: :api_actor

          # @!method initialize(api_key_id:, type: :api_actor)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaPluginAPIActor} for more details.
          #
          #   @param api_key_id [String] The key's ID.
          #
          #   @param type [Symbol, :api_actor] An Admin API key, in the same form the Compliance API activity feed uses for it.
        end
      end
    end
  end
end
