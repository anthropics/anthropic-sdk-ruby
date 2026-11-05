# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaCannotSignOutMembershipAdminErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :cannot_sign_out_membership_admin]
          required :error_code, const: :cannot_sign_out_membership_admin

          # @!method initialize(error_code: :cannot_sign_out_membership_admin)
          #   The member is a membership admin, and the person the API key or token belongs to
          #   is not allowed to sign out membership admins.
          #
          #   @param error_code [Symbol, :cannot_sign_out_membership_admin]
        end
      end
    end
  end
end
