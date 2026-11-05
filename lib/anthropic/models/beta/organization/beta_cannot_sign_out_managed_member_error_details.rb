# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaCannotSignOutManagedMemberErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :cannot_sign_out_managed_member]
          required :error_code, const: :cannot_sign_out_managed_member

          # @!method initialize(error_code: :cannot_sign_out_managed_member)
          #   On a public-sector deployment, only an API key or token that belongs to a person
          #   with owner permissions can sign out a member with the `managed` role.
          #
          #   @param error_code [Symbol, :cannot_sign_out_managed_member]
        end
      end
    end
  end
end
