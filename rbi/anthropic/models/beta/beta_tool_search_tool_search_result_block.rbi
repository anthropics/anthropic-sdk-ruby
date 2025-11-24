# typed: strong

module Anthropic
  module Models
    BetaToolSearchToolSearchResultBlock =
      Beta::BetaToolSearchToolSearchResultBlock

    module Beta
      class BetaToolSearchToolSearchResultBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaToolSearchToolSearchResultBlock,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(T::Array[Anthropic::Beta::BetaToolReferenceBlock]) }
        attr_accessor :tool_references

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            tool_references:
              T::Array[Anthropic::Beta::BetaToolReferenceBlock::OrHash],
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(tool_references:, type: :tool_search_tool_search_result)
        end

        sig do
          override.returns(
            {
              tool_references:
                T::Array[Anthropic::Beta::BetaToolReferenceBlock],
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
