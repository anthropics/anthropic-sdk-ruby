# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsAPIActor < Anthropic::Internal::Type::BaseModel
          # @!attribute api_key_id
          #   Tagged API key ID.
          #
          #   @return [String]
          required :api_key_id, String

          # @!attribute type
          #
          #   @return [Symbol, :api_actor]
          required :type, const: :api_actor

          # @!method initialize(api_key_id:, type: :api_actor)
          #   @param api_key_id [String] Tagged API key ID.
          #
          #   @param type [Symbol, :api_actor]
        end
      end
    end
  end
end
