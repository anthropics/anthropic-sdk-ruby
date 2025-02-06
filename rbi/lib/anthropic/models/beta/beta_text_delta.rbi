# typed: strong

module Anthropic
  module Models
    BetaTextDelta = T.type_alias { Beta::BetaTextDelta }

    module Beta
      class BetaTextDelta < Anthropic::BaseModel
        sig { returns(String) }
        attr_accessor :text

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(text: String, type: Symbol).void }
        def initialize(text:, type: :text_delta); end

        sig { override.returns({text: String, type: Symbol}) }
        def to_hash; end
      end
    end
  end
end
