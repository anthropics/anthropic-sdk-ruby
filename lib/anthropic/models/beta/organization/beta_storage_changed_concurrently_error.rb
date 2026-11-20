# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # Another request changed this storage setting while this one was running, so this
        # request left it as it is. Read the Workspace and send the request again if you
        # still want the change.
        class BetaStorageChangedConcurrentlyError < Anthropic::Errors::ConflictError
          # @!method error_code
          #   @return [Symbol, :storage_changed_concurrently]

          # @return [Anthropic::Models::Beta::Organization::BetaStorageChangedConcurrentlyErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaStorageChangedConcurrentlyErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
