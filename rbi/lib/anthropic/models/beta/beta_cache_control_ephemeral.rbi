# typed: strong

module Anthropic
  module Models
    BetaCacheControlEphemeral = T.type_alias { Beta::BetaCacheControlEphemeral }

    module Beta
      class BetaCacheControlEphemeral < Anthropic::BaseModel
        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig { params(type: Symbol).void }
        def initialize(type: :ephemeral)
        end

        sig { override.returns({type: Symbol}) }
        def to_hash
        end
      end
    end
  end
end
