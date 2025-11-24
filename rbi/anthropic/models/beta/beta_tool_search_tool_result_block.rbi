# typed: strong

module Anthropic
  module Models
    BetaToolSearchToolResultBlock = Beta::BetaToolSearchToolResultBlock

    module Beta
      class BetaToolSearchToolResultBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaToolSearchToolResultBlock,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaToolSearchToolResultBlock::Content::Variants
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
                Anthropic::Beta::BetaToolSearchToolResultError::OrHash,
                Anthropic::Beta::BetaToolSearchToolSearchResultBlock::OrHash
              ),
            tool_use_id: String,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(content:, tool_use_id:, type: :tool_search_tool_result)
        end

        sig do
          override.returns(
            {
              content:
                Anthropic::Beta::BetaToolSearchToolResultBlock::Content::Variants,
              tool_use_id: String,
              type: Symbol
            }
          )
        end
        def to_hash
        end

        module Content
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaToolSearchToolResultError,
                Anthropic::Beta::BetaToolSearchToolSearchResultBlock
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaToolSearchToolResultBlock::Content::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
