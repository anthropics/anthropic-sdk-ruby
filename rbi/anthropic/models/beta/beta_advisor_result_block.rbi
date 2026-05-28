# typed: strong

module Anthropic
  module Models
    BetaAdvisorResultBlock = Beta::BetaAdvisorResultBlock

    module Beta
      class BetaAdvisorResultBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaAdvisorResultBlock,
              Anthropic::Internal::AnyHash
            )
          end

        # The advisor sub-inference's stop reason (same values as the top-level message
        # `stop_reason`). `max_tokens` indicates the advisor's output was truncated at the
        # tool's `max_tokens` value or the advisor model's policy cap.
        sig { returns(T.nilable(String)) }
        attr_accessor :stop_reason

        sig { returns(String) }
        attr_accessor :text

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            stop_reason: T.nilable(String),
            text: String,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The advisor sub-inference's stop reason (same values as the top-level message
          # `stop_reason`). `max_tokens` indicates the advisor's output was truncated at the
          # tool's `max_tokens` value or the advisor model's policy cap.
          stop_reason:,
          text:,
          type: :advisor_result
        )
        end

        sig do
          override.returns(
            { stop_reason: T.nilable(String), text: String, type: Symbol }
          )
        end
        def to_hash
        end
      end
    end
  end
end
