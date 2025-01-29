# typed: strong

module Anthropic
  module Models
    BetaInputJSONDelta = T.type_alias { Beta::BetaInputJSONDelta }

    module Beta
      class BetaInputJSONDelta < Anthropic::BaseModel
        Shape = T.type_alias { {partial_json: String, type: Symbol} }

        sig { returns(String) }
        attr_accessor :partial_json

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(partial_json: String, type: Symbol).void }
        def initialize(partial_json:, type: :input_json_delta); end

        sig { returns(Anthropic::Models::Beta::BetaInputJSONDelta::Shape) }
        def to_h; end
      end
    end
  end
end
