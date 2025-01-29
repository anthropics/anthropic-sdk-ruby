# typed: strong

module Anthropic
  module Models
    class RawMessageStopEvent < Anthropic::BaseModel
      Shape = T.type_alias { {type: Symbol} }

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(type: Symbol).void }
      def initialize(type: :message_stop); end

      sig { returns(Anthropic::Models::RawMessageStopEvent::Shape) }
      def to_h; end
    end
  end
end
