# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # The member is an owner or has owner permissions, and this API key or token
        # cannot sign them out. In a Claude Enterprise organization, an API key with the
        # `write:members` scope can.
        class BetaCannotSignOutOwnerError < Anthropic::Errors::PermissionDeniedError
          # @!method error_code
          #   @return [Symbol, :cannot_sign_out_owner]

          # @return [Anthropic::Models::Beta::Organization::BetaCannotSignOutOwnerErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaCannotSignOutOwnerErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
