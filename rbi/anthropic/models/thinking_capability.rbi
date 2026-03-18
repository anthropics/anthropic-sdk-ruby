# typed: strong

module Anthropic
  module Models
    class ThinkingCapability < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ThinkingCapability, Anthropic::Internal::AnyHash)
        end

      # Whether this capability is supported by the model.
      sig { returns(T::Boolean) }
      attr_accessor :supported

      # Supported thinking type configurations.
      sig { returns(Anthropic::ThinkingTypes) }
      attr_reader :types

      sig { params(types: Anthropic::ThinkingTypes::OrHash).void }
      attr_writer :types

      # Thinking capability details.
      sig do
        params(
          supported: T::Boolean,
          types: Anthropic::ThinkingTypes::OrHash
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
          { supported: T::Boolean, types: Anthropic::ThinkingTypes }
        )
      end
      def to_hash
      end
    end
  end
end
