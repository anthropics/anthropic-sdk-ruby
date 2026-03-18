# typed: strong

module Anthropic
  module Models
    class EffortCapability < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::EffortCapability, Anthropic::Internal::AnyHash)
        end

      # Whether the model supports high effort level.
      sig { returns(Anthropic::CapabilitySupport) }
      attr_reader :high

      sig { params(high: Anthropic::CapabilitySupport::OrHash).void }
      attr_writer :high

      # Whether the model supports low effort level.
      sig { returns(Anthropic::CapabilitySupport) }
      attr_reader :low

      sig { params(low: Anthropic::CapabilitySupport::OrHash).void }
      attr_writer :low

      # Whether the model supports max effort level.
      sig { returns(Anthropic::CapabilitySupport) }
      attr_reader :max

      sig { params(max: Anthropic::CapabilitySupport::OrHash).void }
      attr_writer :max

      # Whether the model supports medium effort level.
      sig { returns(Anthropic::CapabilitySupport) }
      attr_reader :medium

      sig { params(medium: Anthropic::CapabilitySupport::OrHash).void }
      attr_writer :medium

      # Whether this capability is supported by the model.
      sig { returns(T::Boolean) }
      attr_accessor :supported

      # Effort (reasoning_effort) capability details.
      sig do
        params(
          high: Anthropic::CapabilitySupport::OrHash,
          low: Anthropic::CapabilitySupport::OrHash,
          max: Anthropic::CapabilitySupport::OrHash,
          medium: Anthropic::CapabilitySupport::OrHash,
          supported: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Whether the model supports high effort level.
        high:,
        # Whether the model supports low effort level.
        low:,
        # Whether the model supports max effort level.
        max:,
        # Whether the model supports medium effort level.
        medium:,
        # Whether this capability is supported by the model.
        supported:
      )
      end

      sig do
        override.returns(
          {
            high: Anthropic::CapabilitySupport,
            low: Anthropic::CapabilitySupport,
            max: Anthropic::CapabilitySupport,
            medium: Anthropic::CapabilitySupport,
            supported: T::Boolean
          }
        )
      end
      def to_hash
      end
    end
  end
end
