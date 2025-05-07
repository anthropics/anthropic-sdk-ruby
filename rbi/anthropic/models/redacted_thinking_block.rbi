# typed: strong

module Anthropic
  module Models
    class RedactedThinkingBlock < Anthropic::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(T.self_type, Anthropic::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :data

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(data: String, type: Symbol).returns(T.attached_class) }
      def self.new(data:, type: :redacted_thinking)
      end

      sig { override.returns({ data: String, type: Symbol }) }
      def to_hash
      end
    end
  end
end
