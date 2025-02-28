# typed: strong

module Anthropic
  module Models
    BetaToolChoiceNone = T.type_alias { Beta::BetaToolChoiceNone }

    module Beta
      class BetaToolChoiceNone < Anthropic::BaseModel
        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig { params(type: Symbol).void }
        def initialize(type: :none)
        end

        sig { override.returns({type: Symbol}) }
        def to_hash
        end
      end
    end
  end
end
