# typed: strong

module Anthropic
  module Models
    class InputJSONDelta < Anthropic::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(T.self_type, Anthropic::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :partial_json

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(partial_json: String, type: Symbol).returns(T.attached_class)
      end
      def self.new(partial_json:, type: :input_json_delta)
      end

      sig { override.returns({ partial_json: String, type: Symbol }) }
      def to_hash
      end
    end
  end
end
