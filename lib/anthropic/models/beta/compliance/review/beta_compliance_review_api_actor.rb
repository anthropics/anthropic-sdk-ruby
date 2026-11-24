# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewAPIActor < Anthropic::Internal::Type::BaseModel
            # @!attribute api_key_id
            #   The ID of the API key (`apikey_...`).
            #
            #   @return [String]
            required :api_key_id, String

            # @!attribute type
            #
            #   @return [Symbol, :api_actor]
            required :type, const: :api_actor

            # @!method initialize(api_key_id:, type: :api_actor)
            #   An API key.
            #
            #   @param api_key_id [String] The ID of the API key (`apikey_...`).
            #
            #   @param type [Symbol, :api_actor]
          end
        end
      end
    end
  end
end
