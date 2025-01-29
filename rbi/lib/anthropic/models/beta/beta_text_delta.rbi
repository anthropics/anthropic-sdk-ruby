# typed: strong

module Anthropic
  module Models
    BetaTextDelta = T.type_alias { Beta::BetaTextDelta }

    module Beta
      class BetaTextDelta < Anthropic::BaseModel
        Shape = T.type_alias { {text: String, type: Symbol} }

        sig { returns(String) }
        attr_accessor :text

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(text: String, type: Symbol).void }
        def initialize(text:, type: :text_delta); end

        sig { returns(Anthropic::Models::Beta::BetaTextDelta::Shape) }
        def to_h; end
      end
    end
  end
end
