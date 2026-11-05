# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaCannotSignOutPrivilegedMemberErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :cannot_sign_out_privileged_member]
          required :error_code, const: :cannot_sign_out_privileged_member

          # @!method initialize(error_code: :cannot_sign_out_privileged_member)
          #   This OAuth token cannot sign out a membership admin or a member whose roles
          #   grant owner, user management, or identity and access management.
          #
          #   @param error_code [Symbol, :cannot_sign_out_privileged_member]
        end
      end
    end
  end
end
