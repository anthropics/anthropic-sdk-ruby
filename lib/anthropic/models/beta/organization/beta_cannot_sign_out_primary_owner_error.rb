# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # The member is the organization's primary owner, whom no API key or token can
        # sign out.
        class BetaCannotSignOutPrimaryOwnerError < Anthropic::Errors::BadRequestError
          # @!method error_code
          #   @return [Symbol, :cannot_sign_out_primary_owner]

          # @return [Anthropic::Models::Beta::Organization::BetaCannotSignOutPrimaryOwnerErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaCannotSignOutPrimaryOwnerErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
