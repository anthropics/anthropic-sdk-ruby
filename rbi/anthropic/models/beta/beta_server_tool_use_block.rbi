# typed: strong

module Anthropic
  module Models
    BetaServerToolUseBlock = Beta::BetaServerToolUseBlock

    module Beta
      class BetaServerToolUseBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaServerToolUseBlock,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(T.anything) }
        attr_accessor :input

        sig do
          returns(Anthropic::Beta::BetaServerToolUseBlock::Name::TaggedSymbol)
        end
        attr_accessor :name

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            id: String,
            input: T.anything,
            name: Anthropic::Beta::BetaServerToolUseBlock::Name::OrSymbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(id:, input:, name:, type: :server_tool_use)
        end

        sig do
          override.returns(
            {
              id: String,
              input: T.anything,
              name: Anthropic::Beta::BetaServerToolUseBlock::Name::TaggedSymbol,
              type: Symbol
            }
          )
        end
        def to_hash
        end

        module Name
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaServerToolUseBlock::Name)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          WEB_SEARCH =
            T.let(
              :web_search,
              Anthropic::Beta::BetaServerToolUseBlock::Name::TaggedSymbol
            )
          CODE_EXECUTION =
            T.let(
              :code_execution,
              Anthropic::Beta::BetaServerToolUseBlock::Name::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaServerToolUseBlock::Name::TaggedSymbol
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
