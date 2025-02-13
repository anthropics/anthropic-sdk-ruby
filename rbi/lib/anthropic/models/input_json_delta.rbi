# typed: strong

module Anthropic
  module Models
    class InputJSONDelta < Anthropic::BaseModel
      sig { returns(String) }
      def partial_json
      end

      sig { params(_: String).returns(String) }
      def partial_json=(_)
      end

      sig { returns(Symbol) }
      def type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def type=(_)
      end

      sig { params(partial_json: String, type: Symbol).void }
      def initialize(partial_json:, type: :input_json_delta)
      end

      sig { override.returns({partial_json: String, type: Symbol}) }
      def to_hash
      end
    end
  end
end
