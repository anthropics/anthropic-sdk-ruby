# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class ExternalKeyChangedErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :external_key_changed]
        required :error_code, const: :external_key_changed

        # @!method initialize(error_code: :external_key_changed)
        #   The external key changed while the request was validating it. Send the request
        #   again.
        #
        #   @param error_code [Symbol, :external_key_changed]
      end
    end
  end
end
