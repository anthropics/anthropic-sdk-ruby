# typed: strong

module Anthropic
  module Models
    class RawContentBlockStopEvent < Anthropic::BaseModel
      sig { returns(Integer) }
      attr_accessor :index

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(index: Integer, type: Symbol).void }
      def initialize(index:, type: :content_block_stop)
      end

      sig { override.returns({index: Integer, type: Symbol}) }
      def to_hash
      end
    end
  end
end
