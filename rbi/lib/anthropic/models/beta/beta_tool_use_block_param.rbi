# typed: strong

module Anthropic
  module Models
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
        attr_reader :cache_control

        sig do
          params(
            cache_control: T.nilable(T.any(Anthropic::Models::Beta::BetaCacheControlEphemeral, Anthropic::Internal::Util::AnyHash))
          )
            .void
        end
        attr_writer :cache_control

        sig do
          params(
            id: String,
            input: T.anything,
            name: String,
            cache_control: T.nilable(T.any(Anthropic::Models::Beta::BetaCacheControlEphemeral, Anthropic::Internal::Util::AnyHash)),
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
