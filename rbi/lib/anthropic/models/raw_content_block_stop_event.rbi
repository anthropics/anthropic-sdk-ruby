# typed: strong

module Anthropic
  module Models
    class RawContentBlockStopEvent < Anthropic::BaseModel
      sig { returns(Integer) }
      def index
      end

      sig { params(_: Integer).returns(Integer) }
      def index=(_)
      end

      sig { returns(Symbol) }
      def type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def type=(_)
      end

      sig { params(index: Integer, type: Symbol).void }
      def initialize(index:, type: :content_block_stop)
      end

      sig { override.returns({index: Integer, type: Symbol}) }
      def to_hash
      end
    end
  end
end
