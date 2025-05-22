# typed: strong

module Anthropic
  module Models
    BetaMCPToolResultBlock = Beta::BetaMCPToolResultBlock

    module Beta
      class BetaMCPToolResultBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaMCPToolResultBlock,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(Anthropic::Beta::BetaMCPToolResultBlock::Content::Variants)
        end
        attr_accessor :content

        sig { returns(T::Boolean) }
        attr_accessor :is_error

        sig { returns(String) }
        attr_accessor :tool_use_id

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            content: Anthropic::Beta::BetaMCPToolResultBlock::Content::Variants,
            is_error: T::Boolean,
            tool_use_id: String,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(content:, is_error:, tool_use_id:, type: :mcp_tool_result)
        end

        sig do
          override.returns(
            {
              content:
                Anthropic::Beta::BetaMCPToolResultBlock::Content::Variants,
              is_error: T::Boolean,
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
              T.any(String, T::Array[Anthropic::Beta::BetaTextBlock])
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaMCPToolResultBlock::Content::Variants
              ]
            )
          end
          def self.variants
          end

          BetaTextBlockArray =
            T.let(
              Anthropic::Internal::Type::ArrayOf[
                Anthropic::Beta::BetaTextBlock
              ],
              Anthropic::Internal::Type::Converter
            )
        end
      end
    end
  end
end
