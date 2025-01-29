# typed: strong

module Anthropic
  module Models
    BetaCacheControlEphemeral = T.type_alias { Beta::BetaCacheControlEphemeral }

    module Beta
      class BetaCacheControlEphemeral < Anthropic::BaseModel
        Shape = T.type_alias { {type: Symbol} }

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(type: Symbol).void }
        def initialize(type: :ephemeral); end

        sig { returns(Anthropic::Models::Beta::BetaCacheControlEphemeral::Shape) }
        def to_h; end
      end
    end
  end
end
