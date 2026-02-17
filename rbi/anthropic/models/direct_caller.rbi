# typed: strong

module Anthropic
  module Models
    class DirectCaller < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::DirectCaller, Anthropic::Internal::AnyHash)
        end

      sig { returns(Symbol) }
      attr_accessor :type

      # Tool invocation directly from the model.
      sig { params(type: Symbol).returns(T.attached_class) }
      def self.new(type: :direct)
      end

      sig { override.returns({ type: Symbol }) }
      def to_hash
      end
    end
  end
end
