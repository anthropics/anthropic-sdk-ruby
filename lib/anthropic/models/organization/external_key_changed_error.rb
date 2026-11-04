# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # The external key changed while the request was validating it. Send the request
      # again.
      class ExternalKeyChangedError < Anthropic::Errors::ConflictError
        # @!method error_code
        #   @return [Symbol, :external_key_changed]

        # @return [Anthropic::Models::Organization::ExternalKeyChangedErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Organization::ExternalKeyChangedErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end
