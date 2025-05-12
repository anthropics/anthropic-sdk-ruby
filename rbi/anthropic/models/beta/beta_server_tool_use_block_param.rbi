# typed: strong

module Anthropic
  module Models
    BetaServerToolUseBlockParam = Beta::BetaServerToolUseBlockParam

    module Beta
      class BetaServerToolUseBlockParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaServerToolUseBlockParam,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(T.anything) }
        attr_accessor :input

        sig { returns(Symbol) }
        attr_accessor :name

        sig { returns(Symbol) }
        attr_accessor :type

        # Create a cache control breakpoint at this content block.
        sig { returns(T.nilable(Anthropic::Beta::BetaCacheControlEphemeral)) }
        attr_reader :cache_control

        sig do
          params(
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash)
          ).void
        end
        attr_writer :cache_control

        sig do
          params(
            id: String,
            input: T.anything,
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            name: Symbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          input:,
          # Create a cache control breakpoint at this content block.
          cache_control: nil,
          name: :web_search,
          type: :server_tool_use
        )
        end

        sig do
          override.returns(
            {
              id: String,
              input: T.anything,
              name: Symbol,
              type: Symbol,
              cache_control:
                T.nilable(Anthropic::Beta::BetaCacheControlEphemeral)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
