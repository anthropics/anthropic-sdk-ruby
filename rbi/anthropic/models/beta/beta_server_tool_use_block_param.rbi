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

        sig do
          returns(Anthropic::Beta::BetaServerToolUseBlockParam::Name::OrSymbol)
        end
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
            name: Anthropic::Beta::BetaServerToolUseBlockParam::Name::OrSymbol,
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          input:,
          name:,
          # Create a cache control breakpoint at this content block.
          cache_control: nil,
          type: :server_tool_use
        )
        end

        sig do
          override.returns(
            {
              id: String,
              input: T.anything,
              name:
                Anthropic::Beta::BetaServerToolUseBlockParam::Name::OrSymbol,
              type: Symbol,
              cache_control:
                T.nilable(Anthropic::Beta::BetaCacheControlEphemeral)
            }
          )
        end
        def to_hash
        end

        module Name
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaServerToolUseBlockParam::Name)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          WEB_SEARCH =
            T.let(
              :web_search,
              Anthropic::Beta::BetaServerToolUseBlockParam::Name::TaggedSymbol
            )
          CODE_EXECUTION =
            T.let(
              :code_execution,
              Anthropic::Beta::BetaServerToolUseBlockParam::Name::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaServerToolUseBlockParam::Name::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
