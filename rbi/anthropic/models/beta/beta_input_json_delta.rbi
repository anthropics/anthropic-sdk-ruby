# typed: strong

module Anthropic
  module Models
    BetaInputJSONDelta = Beta::BetaInputJSONDelta

    module Beta
      class BetaInputJSONDelta < Anthropic::Internal::Type::BaseModel
        sig { returns(String) }
        attr_accessor :partial_json

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(partial_json: String, type: Symbol).returns(T.attached_class) }
        def self.new(partial_json:, type: :input_json_delta); end

        sig { override.returns({partial_json: String, type: Symbol}) }
        def to_hash; end
      end
    end
  end
end
