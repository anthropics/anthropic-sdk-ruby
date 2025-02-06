# typed: strong

module Anthropic
  module Models
    BetaToolUseBlockParam = T.type_alias { Beta::BetaToolUseBlockParam }

    module Beta
      class BetaToolUseBlockParam < Anthropic::BaseModel
        sig { returns(String) }
        attr_accessor :id

        sig { returns(T.anything) }
        attr_accessor :input

        sig { returns(String) }
        attr_accessor :name

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)) }
        attr_accessor :cache_control

        sig do
          params(
            id: String,
            input: T.anything,
            name: String,
            cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral),
            type: Symbol
          ).void
        end
        def initialize(id:, input:, name:, cache_control: nil, type: :tool_use)
        end

        sig do
          override.returns(
            {
              id: String,
              input: T.anything,
              name: String,
              type: Symbol,
              cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
