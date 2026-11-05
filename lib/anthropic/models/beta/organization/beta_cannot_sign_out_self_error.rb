# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # The member is the user the API key or token belongs to.
        class BetaCannotSignOutSelfError < Anthropic::Errors::BadRequestError
          # @!method error_code
          #   @return [Symbol, :cannot_sign_out_self]

          # @return [Anthropic::Models::Beta::Organization::BetaCannotSignOutSelfErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaCannotSignOutSelfErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
