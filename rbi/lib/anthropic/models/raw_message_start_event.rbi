# typed: strong

module Anthropic
  module Models
    class RawMessageStartEvent < Anthropic::Internal::Type::BaseModel
      sig { returns(Anthropic::Models::Message) }
      attr_reader :message

      sig { params(message: T.any(Anthropic::Models::Message, Anthropic::Internal::AnyHash)).void }
      attr_writer :message

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(message: T.any(Anthropic::Models::Message, Anthropic::Internal::AnyHash), type: Symbol)
          .returns(T.attached_class)
      end
      def self.new(message:, type: :message_start)
      end

      sig { override.returns({message: Anthropic::Models::Message, type: Symbol}) }
      def to_hash
      end
    end
  end
end
