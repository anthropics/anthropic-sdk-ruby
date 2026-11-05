# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaCannotSignOutOwnerErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :cannot_sign_out_owner]
          required :error_code, const: :cannot_sign_out_owner

          # @!method initialize(error_code: :cannot_sign_out_owner)
          #   The member is an owner or has owner permissions, and this API key or token
          #   cannot sign them out. In a Claude Enterprise organization, an API key with the
          #   `write:members` scope can.
          #
          #   @param error_code [Symbol, :cannot_sign_out_owner]
        end
      end
    end
  end
end
