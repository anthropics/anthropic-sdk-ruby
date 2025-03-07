# typed: strong

module Anthropic
  module Models
    class RawMessageStartEvent < Anthropic::BaseModel
      sig { returns(Anthropic::Models::Message) }
      def message
      end

      sig { params(_: Anthropic::Models::Message).returns(Anthropic::Models::Message) }
      def message=(_)
      end

      sig { returns(Symbol) }
      def type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def type=(_)
      end

      sig { params(message: Anthropic::Models::Message, type: Symbol).returns(T.attached_class) }
      def self.new(message:, type: :message_start)
      end

      sig { override.returns({message: Anthropic::Models::Message, type: Symbol}) }
      def to_hash
      end
    end
  end
end
