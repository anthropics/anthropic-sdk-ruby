# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaCannotSignOutSelfErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :cannot_sign_out_self]
          required :error_code, const: :cannot_sign_out_self

          # @!method initialize(error_code: :cannot_sign_out_self)
          #   The member is the user the API key or token belongs to.
          #
          #   @param error_code [Symbol, :cannot_sign_out_self]
        end
      end
    end
  end
end
