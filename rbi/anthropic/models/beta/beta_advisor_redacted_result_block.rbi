# typed: strong

module Anthropic
  module Models
    BetaAdvisorRedactedResultBlock = Beta::BetaAdvisorRedactedResultBlock

    module Beta
      class BetaAdvisorRedactedResultBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaAdvisorRedactedResultBlock,
              Anthropic::Internal::AnyHash
            )
          end

        # Opaque blob containing the advisor's output. Round-trip verbatim; do not inspect
        # or modify.
        sig { returns(String) }
        attr_accessor :encrypted_content

        # The advisor sub-inference's stop reason (same values as the top-level message
        # `stop_reason`).
        sig { returns(T.nilable(String)) }
        attr_accessor :stop_reason

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            encrypted_content: String,
            stop_reason: T.nilable(String),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Opaque blob containing the advisor's output. Round-trip verbatim; do not inspect
          # or modify.
          encrypted_content:,
          # The advisor sub-inference's stop reason (same values as the top-level message
          # `stop_reason`).
          stop_reason:,
          type: :advisor_redacted_result
        )
        end

        sig do
          override.returns(
            {
              encrypted_content: String,
              stop_reason: T.nilable(String),
              type: Symbol
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
