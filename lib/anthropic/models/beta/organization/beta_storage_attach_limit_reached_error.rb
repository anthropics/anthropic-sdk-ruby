# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # The Workspace has reached its limit of 100 different External Storage resources
        # attached over its lifetime. Detached storage counts toward the limit until it is
        # deleted.
        class BetaStorageAttachLimitReachedError < Anthropic::Errors::BadRequestError
          # @!method error_code
          #   @return [Symbol, :storage_attach_limit_reached]

          # @return [Anthropic::Models::Beta::Organization::BetaStorageAttachLimitReachedErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaStorageAttachLimitReachedErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
