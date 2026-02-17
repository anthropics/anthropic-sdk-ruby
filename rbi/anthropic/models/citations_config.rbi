# typed: strong

module Anthropic
  module Models
    class CitationsConfig < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::CitationsConfig, Anthropic::Internal::AnyHash)
        end

      sig { returns(T::Boolean) }
      attr_accessor :enabled

      sig { params(enabled: T::Boolean).returns(T.attached_class) }
      def self.new(enabled:)
      end

      sig { override.returns({ enabled: T::Boolean }) }
      def to_hash
      end
    end
  end
end
