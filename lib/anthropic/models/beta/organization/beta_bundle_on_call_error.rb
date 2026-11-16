# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # This Bundle's instructions are managed in claude.ai and can't be changed through
        # the API.
        class BetaBundleOnCallError < Anthropic::Errors::BadRequestError
          # @!method error_code
          #   @return [Symbol, :bundle_on_call]

          # @return [Anthropic::Models::Beta::Organization::BetaBundleOnCallErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaBundleOnCallErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
