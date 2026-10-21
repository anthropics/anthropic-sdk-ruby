# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsMemoryPreconditionFailedError < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPreconditionFailedError,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # A human-readable explanation of why the precondition failed.
          sig { returns(T.nilable(String)) }
          attr_reader :message

          sig { params(message: String).void }
          attr_writer :message

          # The error returned with HTTP status 409 when a request's precondition doesn't
          # hold for the memory's current state, such as `precondition` on an update or
          # `expected_content_sha256` on a delete.
          #
          # The error doesn't include the memory's current state. Retrieve the memory to see
          # its current content and `content_sha256` before you retry.
          #
          # See the
          # [memory guide](https://platform.claude.com/docs/en/managed-agents/memory#safe-content-edits-optimistic-concurrency)
          # to learn more about safe content edits with content hash preconditions.
          sig do
            params(message: String, type: Symbol).returns(T.attached_class)
          end
          def self.new(
            # A human-readable explanation of why the precondition failed.
            message: nil,
            type: :memory_precondition_failed_error
          )
          end

          sig { override.returns({ type: Symbol, message: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
