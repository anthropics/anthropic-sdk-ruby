# typed: strong

module Anthropic
  module Models
    BetaThinkingTypes = Beta::BetaThinkingTypes

    module Beta
      class BetaThinkingTypes < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaThinkingTypes,
              Anthropic::Internal::AnyHash
            )
          end

        # Whether the model accepts thinking with type 'adaptive' (the model decides
        # whether and how much to think).
        sig { returns(Anthropic::Beta::BetaCapabilitySupport) }
        attr_reader :adaptive

        sig do
          params(adaptive: Anthropic::Beta::BetaCapabilitySupport::OrHash).void
        end
        attr_writer :adaptive

        # Whether the model accepts thinking with type 'between_tools' (thinking turned
        # off, and any short progress updates the model writes between tool calls come
        # back as thinking blocks). False exactly when a request that sends it gets a 400
        # from this model. A request that sends 'between_tools' can still be rejected for
        # another reason, such as an effort level the model does not allow with thinking
        # off.
        sig { returns(Anthropic::Beta::BetaCapabilitySupport) }
        attr_reader :between_tools

        sig do
          params(
            between_tools: Anthropic::Beta::BetaCapabilitySupport::OrHash
          ).void
        end
        attr_writer :between_tools

        # Whether the model accepts thinking with type 'disabled' (thinking turned off).
        # False exactly when a request that sends it gets a 400 from this model. True on a
        # model that does not support thinking. A request that sends 'disabled' can still
        # be rejected for another reason, such as an effort level the model does not allow
        # with thinking off.
        sig { returns(Anthropic::Beta::BetaCapabilitySupport) }
        attr_reader :disabled

        sig do
          params(disabled: Anthropic::Beta::BetaCapabilitySupport::OrHash).void
        end
        attr_writer :disabled

        # Whether the model accepts thinking with type 'enabled' (extended thinking with a
        # caller-set `budget_tokens`).
        sig { returns(Anthropic::Beta::BetaCapabilitySupport) }
        attr_reader :enabled

        sig do
          params(enabled: Anthropic::Beta::BetaCapabilitySupport::OrHash).void
        end
        attr_writer :enabled

        # Which `thinking.type` values the model accepts on requests. Read each key on its
        # own: for example, `enabled` can be false while `disabled` is true.
        sig do
          params(
            adaptive: Anthropic::Beta::BetaCapabilitySupport::OrHash,
            between_tools: Anthropic::Beta::BetaCapabilitySupport::OrHash,
            disabled: Anthropic::Beta::BetaCapabilitySupport::OrHash,
            enabled: Anthropic::Beta::BetaCapabilitySupport::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether the model accepts thinking with type 'adaptive' (the model decides
          # whether and how much to think).
          adaptive:,
          # Whether the model accepts thinking with type 'between_tools' (thinking turned
          # off, and any short progress updates the model writes between tool calls come
          # back as thinking blocks). False exactly when a request that sends it gets a 400
          # from this model. A request that sends 'between_tools' can still be rejected for
          # another reason, such as an effort level the model does not allow with thinking
          # off.
          between_tools:,
          # Whether the model accepts thinking with type 'disabled' (thinking turned off).
          # False exactly when a request that sends it gets a 400 from this model. True on a
          # model that does not support thinking. A request that sends 'disabled' can still
          # be rejected for another reason, such as an effort level the model does not allow
          # with thinking off.
          disabled:,
          # Whether the model accepts thinking with type 'enabled' (extended thinking with a
          # caller-set `budget_tokens`).
          enabled:
        )
        end

        sig do
          override.returns(
            {
              adaptive: Anthropic::Beta::BetaCapabilitySupport,
              between_tools: Anthropic::Beta::BetaCapabilitySupport,
              disabled: Anthropic::Beta::BetaCapabilitySupport,
              enabled: Anthropic::Beta::BetaCapabilitySupport
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
