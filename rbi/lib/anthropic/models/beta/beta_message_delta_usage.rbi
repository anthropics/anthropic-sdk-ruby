# typed: strong

module Anthropic
  module Models
    BetaMessageDeltaUsage = T.type_alias { Beta::BetaMessageDeltaUsage }

    module Beta
      class BetaMessageDeltaUsage < Anthropic::BaseModel
        Shape = T.type_alias { {output_tokens: Integer} }

        sig { returns(Integer) }
        attr_accessor :output_tokens

        sig { params(output_tokens: Integer).void }
        def initialize(output_tokens:); end

        sig { returns(Anthropic::Models::Beta::BetaMessageDeltaUsage::Shape) }
        def to_h; end
      end
    end
  end
end
