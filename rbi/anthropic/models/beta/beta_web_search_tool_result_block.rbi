# typed: strong

module Anthropic
  module Models
    BetaWebSearchToolResultBlock = Beta::BetaWebSearchToolResultBlock

    module Beta
      class BetaWebSearchToolResultBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaWebSearchToolResultBlock,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaWebSearchToolResultBlockContent::Variants
          )
        end
        attr_accessor :content

        sig { returns(String) }
        attr_accessor :tool_use_id

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            content:
              T.any(
                Anthropic::Beta::BetaWebSearchToolResultError::OrHash,
                T::Array[Anthropic::Beta::BetaWebSearchResultBlock::OrHash]
              ),
            tool_use_id: String,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(content:, tool_use_id:, type: :web_search_tool_result)
        end

        sig do
          override.returns(
            {
              content:
                Anthropic::Beta::BetaWebSearchToolResultBlockContent::Variants,
              tool_use_id: String,
              type: Symbol
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
