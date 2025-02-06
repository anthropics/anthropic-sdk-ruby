# typed: strong

module Anthropic
  module Models
    BetaInputJSONDelta = T.type_alias { Beta::BetaInputJSONDelta }

    module Beta
      class BetaInputJSONDelta < Anthropic::BaseModel
        sig { returns(String) }
        attr_accessor :partial_json

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(partial_json: String, type: Symbol).void }
        def initialize(partial_json:, type: :input_json_delta); end

        sig { override.returns({partial_json: String, type: Symbol}) }
        def to_hash; end
      end
    end
  end
end
