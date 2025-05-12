# typed: strong

module Anthropic
  module Models
    class CitationsConfigParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::CitationsConfigParam, Anthropic::Internal::AnyHash)
        end

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :enabled

      sig { params(enabled: T::Boolean).void }
      attr_writer :enabled

      sig { params(enabled: T::Boolean).returns(T.attached_class) }
      def self.new(enabled: nil)
      end

      sig { override.returns({ enabled: T::Boolean }) }
      def to_hash
      end
    end
  end
end
