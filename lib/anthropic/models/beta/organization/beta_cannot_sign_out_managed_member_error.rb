# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # The member has the `managed` role, and this API key or token cannot sign them
        # out. The error message says which keys and tokens can.
        class BetaCannotSignOutManagedMemberError < Anthropic::Errors::PermissionDeniedError
          # @!method error_code
          #   @return [Symbol, :cannot_sign_out_managed_member]

          # @return [Anthropic::Models::Beta::Organization::BetaCannotSignOutManagedMemberErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaCannotSignOutManagedMemberErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
