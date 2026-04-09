# typed: strong

module Anthropic
  module Models
    BetaAdvisorToolResultBlock = Beta::BetaAdvisorToolResultBlock

    module Beta
      class BetaAdvisorToolResultBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaAdvisorToolResultBlock,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaAdvisorToolResultBlock::Content::Variants
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
                Anthropic::Beta::BetaAdvisorToolResultError::OrHash,
                Anthropic::Beta::BetaAdvisorResultBlock::OrHash,
                Anthropic::Beta::BetaAdvisorRedactedResultBlock::OrHash
              ),
            tool_use_id: String,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(content:, tool_use_id:, type: :advisor_tool_result)
        end

        sig do
          override.returns(
            {
              content:
                Anthropic::Beta::BetaAdvisorToolResultBlock::Content::Variants,
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
                Anthropic::Beta::BetaAdvisorToolResultError,
                Anthropic::Beta::BetaAdvisorResultBlock,
                Anthropic::Beta::BetaAdvisorRedactedResultBlock
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaAdvisorToolResultBlock::Content::Variants
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
