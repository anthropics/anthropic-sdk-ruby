# typed: strong

module Anthropic
  module Models
    BetaEffortCapability = Beta::BetaEffortCapability

    module Beta
      class BetaEffortCapability < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaEffortCapability,
              Anthropic::Internal::AnyHash
            )
          end

        # Whether the model supports high effort level.
        sig { returns(Anthropic::Beta::BetaCapabilitySupport) }
        attr_reader :high

        sig do
          params(high: Anthropic::Beta::BetaCapabilitySupport::OrHash).void
        end
        attr_writer :high

        # Whether the model supports low effort level.
        sig { returns(Anthropic::Beta::BetaCapabilitySupport) }
        attr_reader :low

        sig { params(low: Anthropic::Beta::BetaCapabilitySupport::OrHash).void }
        attr_writer :low

        # Whether the model supports max effort level.
        sig { returns(Anthropic::Beta::BetaCapabilitySupport) }
        attr_reader :max

        sig { params(max: Anthropic::Beta::BetaCapabilitySupport::OrHash).void }
        attr_writer :max

        # Whether the model supports medium effort level.
        sig { returns(Anthropic::Beta::BetaCapabilitySupport) }
        attr_reader :medium

        sig do
          params(medium: Anthropic::Beta::BetaCapabilitySupport::OrHash).void
        end
        attr_writer :medium

        # Whether this capability is supported by the model.
        sig { returns(T::Boolean) }
        attr_accessor :supported

        # Indicates whether a capability is supported.
        sig { returns(T.nilable(Anthropic::Beta::BetaCapabilitySupport)) }
        attr_reader :xhigh

        sig do
          params(
            xhigh: T.nilable(Anthropic::Beta::BetaCapabilitySupport::OrHash)
          ).void
        end
        attr_writer :xhigh

        # Effort (reasoning_effort) capability details.
        sig do
          params(
            high: Anthropic::Beta::BetaCapabilitySupport::OrHash,
            low: Anthropic::Beta::BetaCapabilitySupport::OrHash,
            max: Anthropic::Beta::BetaCapabilitySupport::OrHash,
            medium: Anthropic::Beta::BetaCapabilitySupport::OrHash,
            supported: T::Boolean,
            xhigh: T.nilable(Anthropic::Beta::BetaCapabilitySupport::OrHash)
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
          supported:,
          # Indicates whether a capability is supported.
          xhigh:
        )
        end

        sig do
          override.returns(
            {
              high: Anthropic::Beta::BetaCapabilitySupport,
              low: Anthropic::Beta::BetaCapabilitySupport,
              max: Anthropic::Beta::BetaCapabilitySupport,
              medium: Anthropic::Beta::BetaCapabilitySupport,
              supported: T::Boolean,
              xhigh: T.nilable(Anthropic::Beta::BetaCapabilitySupport)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
