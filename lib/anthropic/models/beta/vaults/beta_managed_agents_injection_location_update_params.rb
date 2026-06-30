# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsInjectionLocationUpdateParams < Anthropic::Internal::Type::BaseModel
          # @!attribute body
          #   Substitute when the placeholder appears in the request body.
          #
          #   @return [Boolean, nil]
          optional :body, Anthropic::Internal::Type::Boolean

          # @!attribute header
          #   Substitute when the placeholder appears in a request header value.
          #
          #   @return [Boolean, nil]
          optional :header, Anthropic::Internal::Type::Boolean

          # @!method initialize(body: nil, header: nil)
          #   Updated injection location.
          #
          #   @param body [Boolean] Substitute when the placeholder appears in the request body.
          #
          #   @param header [Boolean] Substitute when the placeholder appears in a request header value.
        end
      end
    end
  end
end
