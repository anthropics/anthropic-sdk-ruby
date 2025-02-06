# typed: strong

module Anthropic
  module Models
    class RawMessageStopEvent < Anthropic::BaseModel
      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(type: Symbol).void }
      def initialize(type: :message_stop); end

      sig { override.returns({type: Symbol}) }
      def to_hash; end
    end
  end
end
