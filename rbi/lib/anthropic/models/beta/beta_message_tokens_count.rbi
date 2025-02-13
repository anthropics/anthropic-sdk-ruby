# typed: strong

module Anthropic
  module Models
    BetaMessageTokensCount = T.type_alias { Beta::BetaMessageTokensCount }

    module Beta
      class BetaMessageTokensCount < Anthropic::BaseModel
        sig { returns(Integer) }
        def input_tokens
        end

        sig { params(_: Integer).returns(Integer) }
        def input_tokens=(_)
        end

        sig { params(input_tokens: Integer).void }
        def initialize(input_tokens:)
        end

        sig { override.returns({input_tokens: Integer}) }
        def to_hash
        end
      end
    end
  end
end
