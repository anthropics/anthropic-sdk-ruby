# typed: strong

module Anthropic
  module Models
    BetaBase64PDFSource = T.type_alias { Beta::BetaBase64PDFSource }

    module Beta
      class BetaBase64PDFSource < Anthropic::BaseModel
        sig { returns(String) }
        attr_accessor :data

        sig { returns(Symbol) }
        attr_accessor :media_type

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(data: String, media_type: Symbol, type: Symbol).void }
        def initialize(data:, media_type: :"application/pdf", type: :base64); end

        sig { override.returns({data: String, media_type: Symbol, type: Symbol}) }
        def to_hash; end
      end
    end
  end
end
