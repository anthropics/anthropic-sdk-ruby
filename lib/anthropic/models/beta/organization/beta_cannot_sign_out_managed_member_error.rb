# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # On a public-sector deployment, only an API key or token that belongs to a person
        # with owner permissions can sign out a member with the `managed` role.
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
