# typed: strong

module Anthropic
  module Models
    class CapabilitySupport < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::CapabilitySupport, Anthropic::Internal::AnyHash)
        end

      # Whether this capability is supported by the model.
      sig { returns(T::Boolean) }
      attr_accessor :supported

      # Indicates whether a capability is supported.
      sig { params(supported: T::Boolean).returns(T.attached_class) }
      def self.new(
        # Whether this capability is supported by the model.
        supported:
      )
      end

      sig { override.returns({ supported: T::Boolean }) }
      def to_hash
      end
    end
  end
end
