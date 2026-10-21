# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsMemoryPreconditionFailedError < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :memory_precondition_failed_error]
          required :type, const: :memory_precondition_failed_error

          # @!attribute message
          #   A human-readable explanation of why the precondition failed.
          #
          #   @return [String, nil]
          optional :message, String

          # @!method initialize(message: nil, type: :memory_precondition_failed_error)
          #   The error returned with HTTP status 409 when a request's precondition doesn't
          #   hold for the memory's current state, such as `precondition` on an update or
          #   `expected_content_sha256` on a delete.
          #
          #   The error doesn't include the memory's current state. Retrieve the memory to see
          #   its current content and `content_sha256` before you retry.
          #
          #   See the
          #   [memory guide](https://platform.claude.com/docs/en/managed-agents/memory#safe-content-edits-optimistic-concurrency)
          #   to learn more about safe content edits with content hash preconditions.
          #
          #   @param message [String] A human-readable explanation of why the precondition failed.
          #
          #   @param type [Symbol, :memory_precondition_failed_error]
        end
      end
    end
  end
end
