# typed: strong

module Anthropic
  module Models
    class ThinkingTypes < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ThinkingTypes, Anthropic::Internal::AnyHash)
        end

      # Whether the model accepts thinking with type 'adaptive' (the model decides
      # whether and how much to think).
      sig { returns(Anthropic::CapabilitySupport) }
      attr_reader :adaptive

      sig { params(adaptive: Anthropic::CapabilitySupport::OrHash).void }
      attr_writer :adaptive

      # Whether the model accepts thinking with type 'disabled' (thinking turned off).
      # False exactly when a request that sends it gets a 400 from this model. True on a
      # model that does not support thinking.
      sig { returns(Anthropic::CapabilitySupport) }
      attr_reader :disabled

      sig { params(disabled: Anthropic::CapabilitySupport::OrHash).void }
      attr_writer :disabled

      # Whether the model accepts thinking with type 'enabled' (extended thinking with a
      # caller-set `budget_tokens`).
      sig { returns(Anthropic::CapabilitySupport) }
      attr_reader :enabled

      sig { params(enabled: Anthropic::CapabilitySupport::OrHash).void }
      attr_writer :enabled

      # Which `thinking.type` values the model accepts on requests. Read each key on its
      # own: for example, `enabled` can be false while `disabled` is true.
      sig do
        params(
          adaptive: Anthropic::CapabilitySupport::OrHash,
          disabled: Anthropic::CapabilitySupport::OrHash,
          enabled: Anthropic::CapabilitySupport::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Whether the model accepts thinking with type 'adaptive' (the model decides
        # whether and how much to think).
        adaptive:,
        # Whether the model accepts thinking with type 'disabled' (thinking turned off).
        # False exactly when a request that sends it gets a 400 from this model. True on a
        # model that does not support thinking.
        disabled:,
        # Whether the model accepts thinking with type 'enabled' (extended thinking with a
        # caller-set `budget_tokens`).
        enabled:
      )
      end

      sig do
        override.returns(
          {
            adaptive: Anthropic::CapabilitySupport,
            disabled: Anthropic::CapabilitySupport,
            enabled: Anthropic::CapabilitySupport
          }
        )
      end
      def to_hash
      end
    end
  end
end
