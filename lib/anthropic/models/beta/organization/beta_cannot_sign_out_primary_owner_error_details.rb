# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaCannotSignOutPrimaryOwnerErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :cannot_sign_out_primary_owner]
          required :error_code, const: :cannot_sign_out_primary_owner

          # @!method initialize(error_code: :cannot_sign_out_primary_owner)
          #   The member is the organization's primary owner, whom no API key or token can
          #   sign out.
          #
          #   @param error_code [Symbol, :cannot_sign_out_primary_owner]
        end
      end
    end
  end
end
