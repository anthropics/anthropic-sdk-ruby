# typed: strong

module Anthropic
  module Models
    BetaToolBash20241022 = T.type_alias { Beta::BetaToolBash20241022 }

    module Beta
      class BetaToolBash20241022 < Anthropic::BaseModel
        Shape = T.type_alias do
          {
            name: Symbol,
            type: Symbol,
            cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)
          }
        end

        sig { returns(Symbol) }
        attr_accessor :name

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)) }
        attr_accessor :cache_control

        sig do
          params(
            cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral),
            name: Symbol,
            type: Symbol
          ).void
        end
        def initialize(cache_control: nil, name: :bash, type: :bash_20241022); end

        sig { returns(Anthropic::Models::Beta::BetaToolBash20241022::Shape) }
        def to_h; end
      end
    end
  end
end
