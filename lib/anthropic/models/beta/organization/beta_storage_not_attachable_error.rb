# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # This External Storage can't be attached to the setting named in `field`. The
        # error's `message` says why.
        class BetaStorageNotAttachableError < Anthropic::Errors::BadRequestError
          # @!method error_code
          #   @return [Symbol, :storage_not_attachable]

          # @return [Anthropic::Models::Beta::Organization::BetaStorageNotAttachableErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaStorageNotAttachableErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
