# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # This OAuth token cannot sign out a membership admin or a member whose roles
        # grant owner, user management, or identity and access management.
        class BetaCannotSignOutPrivilegedMemberError < Anthropic::Errors::PermissionDeniedError
          # @!method error_code
          #   @return [Symbol, :cannot_sign_out_privileged_member]

          # @return [Anthropic::Models::Beta::Organization::BetaCannotSignOutPrivilegedMemberErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaCannotSignOutPrivilegedMemberErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
