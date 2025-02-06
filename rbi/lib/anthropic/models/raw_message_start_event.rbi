# typed: strong

module Anthropic
  module Models
    class RawMessageStartEvent < Anthropic::BaseModel
      sig { returns(Anthropic::Models::Message) }
      attr_accessor :message

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(message: Anthropic::Models::Message, type: Symbol).void }
      def initialize(message:, type: :message_start)
      end

      sig { override.returns({message: Anthropic::Models::Message, type: Symbol}) }
      def to_hash
      end
    end
  end
end
