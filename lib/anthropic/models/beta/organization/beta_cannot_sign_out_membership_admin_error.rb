# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # The member is a membership admin, and the person the API key or token belongs to
        # is not allowed to sign out membership admins.
        class BetaCannotSignOutMembershipAdminError < Anthropic::Errors::PermissionDeniedError
          # @!method error_code
          #   @return [Symbol, :cannot_sign_out_membership_admin]

          # @return [Anthropic::Models::Beta::Organization::BetaCannotSignOutMembershipAdminErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaCannotSignOutMembershipAdminErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
