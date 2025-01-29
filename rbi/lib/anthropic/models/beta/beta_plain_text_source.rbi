# typed: strong

module Anthropic
  module Models
    BetaPlainTextSource = T.type_alias { Beta::BetaPlainTextSource }

    module Beta
      class BetaPlainTextSource < Anthropic::BaseModel
        Shape = T.type_alias { {data: String, media_type: Symbol, type: Symbol} }

        sig { returns(String) }
        attr_accessor :data

        sig { returns(Symbol) }
        attr_accessor :media_type

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(data: String, media_type: Symbol, type: Symbol).void }
        def initialize(data:, media_type: :"text/plain", type: :text); end

        sig { returns(Anthropic::Models::Beta::BetaPlainTextSource::Shape) }
        def to_h; end
      end
    end
  end
end
