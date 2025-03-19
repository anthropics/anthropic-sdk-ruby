# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaInputJSONDelta < Anthropic::BaseModel
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

        sig { params(partial_json: String, type: Symbol).returns(T.attached_class) }
        def self.new(partial_json:, type: :input_json_delta)
        end

        sig { override.returns({partial_json: String, type: Symbol}) }
        def to_hash
        end
      end
    end

    BetaInputJSONDelta = Beta::BetaInputJSONDelta
  end
end
