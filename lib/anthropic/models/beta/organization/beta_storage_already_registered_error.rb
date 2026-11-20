# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # The organization already has External Storage for this bucket that it has not
        # deleted. List the organization's External Storage to find it.
        class BetaStorageAlreadyRegisteredError < Anthropic::Errors::ConflictError
          # @!method error_code
          #   @return [Symbol, :storage_already_registered]

          # @return [Anthropic::Models::Beta::Organization::BetaStorageAlreadyRegisteredErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaStorageAlreadyRegisteredErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
