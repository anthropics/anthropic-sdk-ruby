# typed: strong

module Anthropic
  module Models
    BetaToolSearchToolSearchResultBlockParam =
      Beta::BetaToolSearchToolSearchResultBlockParam

    module Beta
      class BetaToolSearchToolSearchResultBlockParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaToolSearchToolSearchResultBlockParam,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(T::Array[Anthropic::Beta::BetaToolReferenceBlockParam]) }
        attr_accessor :tool_references

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            tool_references:
              T::Array[Anthropic::Beta::BetaToolReferenceBlockParam::OrHash],
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(tool_references:, type: :tool_search_tool_search_result)
        end

        sig do
          override.returns(
            {
              tool_references:
                T::Array[Anthropic::Beta::BetaToolReferenceBlockParam],
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
