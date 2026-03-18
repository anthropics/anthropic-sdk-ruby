# typed: strong

module Anthropic
  module Models
    class ThinkingTypes < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ThinkingTypes, Anthropic::Internal::AnyHash)
        end

      # Whether the model supports thinking with type 'adaptive' (auto).
      sig { returns(Anthropic::CapabilitySupport) }
      attr_reader :adaptive

      sig { params(adaptive: Anthropic::CapabilitySupport::OrHash).void }
      attr_writer :adaptive

      # Whether the model supports thinking with type 'enabled'.
      sig { returns(Anthropic::CapabilitySupport) }
      attr_reader :enabled

      sig { params(enabled: Anthropic::CapabilitySupport::OrHash).void }
      attr_writer :enabled

      # Supported thinking type configurations.
      sig do
        params(
          adaptive: Anthropic::CapabilitySupport::OrHash,
          enabled: Anthropic::CapabilitySupport::OrHash
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
            adaptive: Anthropic::CapabilitySupport,
            enabled: Anthropic::CapabilitySupport
          }
        )
      end
      def to_hash
      end
    end
  end
end
