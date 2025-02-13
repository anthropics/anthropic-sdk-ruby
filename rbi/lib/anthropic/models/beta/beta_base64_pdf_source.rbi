# typed: strong

module Anthropic
  module Models
    BetaBase64PDFSource = T.type_alias { Beta::BetaBase64PDFSource }

    module Beta
      class BetaBase64PDFSource < Anthropic::BaseModel
        sig { returns(String) }
        def data
        end

        sig { params(_: String).returns(String) }
        def data=(_)
        end

        sig { returns(Symbol) }
        def media_type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def media_type=(_)
        end

        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig { params(data: String, media_type: Symbol, type: Symbol).void }
        def initialize(data:, media_type: :"application/pdf", type: :base64)
        end

        sig { override.returns({data: String, media_type: Symbol, type: Symbol}) }
        def to_hash
        end
      end
    end
  end
end
