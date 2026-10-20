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
          #   Changes which parts of an outbound request the secret is substituted into. A
          #   location you leave out keeps its current setting.
          #
          #   After the change, at least one location must be enabled.
          #
          #   See
          #   [Authenticate with vaults](https://platform.claude.com/docs/en/managed-agents/vaults#add-a-credential)
          #   to learn more about injection locations.
          #
          #   @param body [Boolean] Substitute when the placeholder appears in the request body.
          #
          #   @param header [Boolean] Substitute when the placeholder appears in a request header value.
        end
      end
    end
  end
end
