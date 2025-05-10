# typed: strong

module Anthropic
  module Models
    class RawContentBlockStopEvent < Anthropic::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(T.self_type, Anthropic::Internal::AnyHash) }

      sig { returns(Integer) }
      attr_accessor :index

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(index: Integer, type: Symbol).returns(T.attached_class) }
      def self.new(index:, type: :content_block_stop)
      end

      sig { override.returns({ index: Integer, type: Symbol }) }
      def to_hash
      end
    end
  end
end
