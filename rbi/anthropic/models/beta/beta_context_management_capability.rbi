# typed: strong

module Anthropic
  module Models
    BetaContextManagementCapability = Beta::BetaContextManagementCapability

    module Beta
      class BetaContextManagementCapability < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaContextManagementCapability,
              Anthropic::Internal::AnyHash
            )
          end

        # Indicates whether a capability is supported.
        sig { returns(T.nilable(Anthropic::Beta::BetaCapabilitySupport)) }
        attr_reader :clear_thinking_20251015

        sig do
          params(
            clear_thinking_20251015:
              T.nilable(Anthropic::Beta::BetaCapabilitySupport::OrHash)
          ).void
        end
        attr_writer :clear_thinking_20251015

        # Indicates whether a capability is supported.
        sig { returns(T.nilable(Anthropic::Beta::BetaCapabilitySupport)) }
        attr_reader :clear_tool_uses_20250919

        sig do
          params(
            clear_tool_uses_20250919:
              T.nilable(Anthropic::Beta::BetaCapabilitySupport::OrHash)
          ).void
        end
        attr_writer :clear_tool_uses_20250919

        # Indicates whether a capability is supported.
        sig { returns(T.nilable(Anthropic::Beta::BetaCapabilitySupport)) }
        attr_reader :compact_20260112

        sig do
          params(
            compact_20260112:
              T.nilable(Anthropic::Beta::BetaCapabilitySupport::OrHash)
          ).void
        end
        attr_writer :compact_20260112

        # Whether this capability is supported by the model.
        sig { returns(T::Boolean) }
        attr_accessor :supported

        # Context management capability details.
        sig do
          params(
            clear_thinking_20251015:
              T.nilable(Anthropic::Beta::BetaCapabilitySupport::OrHash),
            clear_tool_uses_20250919:
              T.nilable(Anthropic::Beta::BetaCapabilitySupport::OrHash),
            compact_20260112:
              T.nilable(Anthropic::Beta::BetaCapabilitySupport::OrHash),
            supported: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # Indicates whether a capability is supported.
          clear_thinking_20251015:,
          # Indicates whether a capability is supported.
          clear_tool_uses_20250919:,
          # Indicates whether a capability is supported.
          compact_20260112:,
          # Whether this capability is supported by the model.
          supported:
        )
        end

        sig do
          override.returns(
            {
              clear_thinking_20251015:
                T.nilable(Anthropic::Beta::BetaCapabilitySupport),
              clear_tool_uses_20250919:
                T.nilable(Anthropic::Beta::BetaCapabilitySupport),
              compact_20260112:
                T.nilable(Anthropic::Beta::BetaCapabilitySupport),
              supported: T::Boolean
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
