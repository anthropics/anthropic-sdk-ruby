# typed: strong

module Anthropic
  module Models
    BetaURLImageSource = T.type_alias { Beta::BetaURLImageSource }

    module Beta
      class BetaURLImageSource < Anthropic::BaseModel
        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig { returns(String) }
        def url
        end

        sig { params(_: String).returns(String) }
        def url=(_)
        end

        sig { params(url: String, type: Symbol).void }
        def initialize(url:, type: :url)
        end

        sig { override.returns({type: Symbol, url: String}) }
        def to_hash
        end
      end
    end
  end
end
