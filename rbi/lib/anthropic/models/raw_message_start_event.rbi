# typed: strong

module Anthropic
  module Models
    class RawMessageStartEvent < Anthropic::BaseModel
      Shape = T.type_alias { {message: Anthropic::Models::Message, type: Symbol} }

      sig { returns(Anthropic::Models::Message) }
      attr_accessor :message

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(message: Anthropic::Models::Message, type: Symbol).void }
      def initialize(message:, type: :message_start); end

      sig { returns(Anthropic::Models::RawMessageStartEvent::Shape) }
      def to_h; end
    end
  end
end
