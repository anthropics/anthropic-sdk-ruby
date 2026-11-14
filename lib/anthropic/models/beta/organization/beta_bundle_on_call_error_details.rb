# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaBundleOnCallErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :bundle_on_call]
          required :error_code, const: :bundle_on_call

          # @!method initialize(error_code: :bundle_on_call)
          #   This Bundle's instructions are managed in claude.ai and can't be changed through
          #   the API.
          #
          #   @param error_code [Symbol, :bundle_on_call]
        end
      end
    end
  end
end
