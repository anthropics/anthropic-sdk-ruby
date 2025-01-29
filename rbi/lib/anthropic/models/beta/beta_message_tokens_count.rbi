# typed: strong

module Anthropic
  module Models
    BetaMessageTokensCount = T.type_alias { Beta::BetaMessageTokensCount }

    module Beta
      class BetaMessageTokensCount < Anthropic::BaseModel
        Shape = T.type_alias { {input_tokens: Integer} }

        sig { returns(Integer) }
        attr_accessor :input_tokens

        sig { params(input_tokens: Integer).void }
        def initialize(input_tokens:); end

        sig { returns(Anthropic::Models::Beta::BetaMessageTokensCount::Shape) }
        def to_h; end
      end
    end
  end
end
