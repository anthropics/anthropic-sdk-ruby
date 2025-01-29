# typed: strong

module Anthropic
  module Models
    class RawContentBlockStopEvent < Anthropic::BaseModel
      Shape = T.type_alias { {index: Integer, type: Symbol} }

      sig { returns(Integer) }
      attr_accessor :index

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(index: Integer, type: Symbol).void }
      def initialize(index:, type: :content_block_stop); end

      sig { returns(Anthropic::Models::RawContentBlockStopEvent::Shape) }
      def to_h; end
    end
  end
end
