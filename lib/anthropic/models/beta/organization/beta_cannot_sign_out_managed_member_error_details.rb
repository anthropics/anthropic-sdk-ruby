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
          #   The member has the `managed` role, and this API key or token cannot sign them
          #   out. The error message says which keys and tokens can.
          #
          #   @param error_code [Symbol, :cannot_sign_out_managed_member]
        end
      end
    end
  end
end
