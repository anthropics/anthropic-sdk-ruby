# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaToolUseBlockParam < Anthropic::BaseModel
        sig { returns(String) }
        def id
        end

        sig { params(_: String).returns(String) }
        def id=(_)
        end

        sig { returns(T.anything) }
        def input
        end

        sig { params(_: T.anything).returns(T.anything) }
        def input=(_)
        end

        sig { returns(String) }
        def name
        end

        sig { params(_: String).returns(String) }
        def name=(_)
        end

        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)) }
        def cache_control
        end

        sig do
          params(_: T.nilable(T.any(Anthropic::Models::Beta::BetaCacheControlEphemeral, Anthropic::Util::AnyHash)))
            .returns(T.nilable(T.any(Anthropic::Models::Beta::BetaCacheControlEphemeral, Anthropic::Util::AnyHash)))
        end
        def cache_control=(_)
        end

        sig do
          params(
            id: String,
            input: T.anything,
            name: String,
            cache_control: T.nilable(T.any(Anthropic::Models::Beta::BetaCacheControlEphemeral, Anthropic::Util::AnyHash)),
            type: Symbol
          )
            .returns(T.attached_class)
        end
        def self.new(id:, input:, name:, cache_control: nil, type: :tool_use)
        end

        sig do
          override
            .returns(
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

    BetaToolUseBlockParam = Beta::BetaToolUseBlockParam
  end
end
