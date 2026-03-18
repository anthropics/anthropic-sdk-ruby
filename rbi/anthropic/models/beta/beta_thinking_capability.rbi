# typed: strong

module Anthropic
  module Models
    BetaThinkingCapability = Beta::BetaThinkingCapability

    module Beta
      class BetaThinkingCapability < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaThinkingCapability,
              Anthropic::Internal::AnyHash
            )
          end

        # Whether this capability is supported by the model.
        sig { returns(T::Boolean) }
        attr_accessor :supported

        # Supported thinking type configurations.
        sig { returns(Anthropic::Beta::BetaThinkingTypes) }
        attr_reader :types

        sig { params(types: Anthropic::Beta::BetaThinkingTypes::OrHash).void }
        attr_writer :types

        # Thinking capability details.
        sig do
          params(
            supported: T::Boolean,
            types: Anthropic::Beta::BetaThinkingTypes::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether this capability is supported by the model.
          supported:,
          # Supported thinking type configurations.
          types:
        )
        end

        sig do
          override.returns(
            { supported: T::Boolean, types: Anthropic::Beta::BetaThinkingTypes }
          )
        end
        def to_hash
        end
      end
    end
  end
end
