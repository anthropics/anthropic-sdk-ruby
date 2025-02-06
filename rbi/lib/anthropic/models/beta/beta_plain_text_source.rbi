# typed: strong

module Anthropic
  module Models
    BetaPlainTextSource = T.type_alias { Beta::BetaPlainTextSource }

    module Beta
      class BetaPlainTextSource < Anthropic::BaseModel
        sig { returns(String) }
        attr_accessor :data

        sig { returns(Symbol) }
        attr_accessor :media_type

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(data: String, media_type: Symbol, type: Symbol).void }
        def initialize(data:, media_type: :"text/plain", type: :text); end

        sig { override.returns({data: String, media_type: Symbol, type: Symbol}) }
        def to_hash; end
      end
    end
  end
end
