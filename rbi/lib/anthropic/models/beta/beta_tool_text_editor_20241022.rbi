# typed: strong

module Anthropic
  module Models
    BetaToolTextEditor20241022 = T.type_alias { Beta::BetaToolTextEditor20241022 }

    module Beta
      class BetaToolTextEditor20241022 < Anthropic::BaseModel
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
        def initialize(cache_control: nil, name: :str_replace_editor, type: :text_editor_20241022); end

        sig do
          override.returns(
            {
              name: Symbol,
              type: Symbol,
              cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)
            }
          )
        end
        def to_hash; end
      end
    end
  end
end
