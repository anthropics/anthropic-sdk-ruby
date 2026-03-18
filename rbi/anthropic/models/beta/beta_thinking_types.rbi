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

        # Whether the model supports thinking with type 'adaptive' (auto).
        sig { returns(Anthropic::Beta::BetaCapabilitySupport) }
        attr_reader :adaptive

        sig do
          params(adaptive: Anthropic::Beta::BetaCapabilitySupport::OrHash).void
        end
        attr_writer :adaptive

        # Whether the model supports thinking with type 'enabled'.
        sig { returns(Anthropic::Beta::BetaCapabilitySupport) }
        attr_reader :enabled

        sig do
          params(enabled: Anthropic::Beta::BetaCapabilitySupport::OrHash).void
        end
        attr_writer :enabled

        # Supported thinking type configurations.
        sig do
          params(
            adaptive: Anthropic::Beta::BetaCapabilitySupport::OrHash,
            enabled: Anthropic::Beta::BetaCapabilitySupport::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether the model supports thinking with type 'adaptive' (auto).
          adaptive:,
          # Whether the model supports thinking with type 'enabled'.
          enabled:
        )
        end

        sig do
          override.returns(
            {
              adaptive: Anthropic::Beta::BetaCapabilitySupport,
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
