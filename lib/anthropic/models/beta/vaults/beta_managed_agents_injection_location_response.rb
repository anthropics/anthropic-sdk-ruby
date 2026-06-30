# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsInjectionLocationResponse < Anthropic::Internal::Type::BaseModel
          # @!attribute body
          #   Whether the placeholder is substituted in the request body.
          #
          #   @return [Boolean]
          required :body, Anthropic::Internal::Type::Boolean

          # @!attribute header
          #   Whether the placeholder is substituted in request header values.
          #
          #   @return [Boolean]
          required :header, Anthropic::Internal::Type::Boolean

          # @!method initialize(body:, header:)
          #   Where in the outbound request the secret value is substituted.
          #
          #   @param body [Boolean] Whether the placeholder is substituted in the request body.
          #
          #   @param header [Boolean] Whether the placeholder is substituted in request header values.
        end
      end
    end
  end
end
