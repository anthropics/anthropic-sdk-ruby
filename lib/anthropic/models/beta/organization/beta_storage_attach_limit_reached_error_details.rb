# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaStorageAttachLimitReachedErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :storage_attach_limit_reached]
          required :error_code, const: :storage_attach_limit_reached

          # @!method initialize(error_code: :storage_attach_limit_reached)
          #   The Workspace has reached its limit of 100 different External Storage resources
          #   attached over its lifetime. Detached storage counts toward the limit until it is
          #   deleted.
          #
          #   @param error_code [Symbol, :storage_attach_limit_reached]
        end
      end
    end
  end
end
