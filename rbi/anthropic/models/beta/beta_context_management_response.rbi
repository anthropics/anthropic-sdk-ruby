# typed: strong

module Anthropic
  module Models
    BetaContextManagementResponse = Beta::BetaContextManagementResponse

    module Beta
      class BetaContextManagementResponse < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaContextManagementResponse,
              Anthropic::Internal::AnyHash
            )
          end

        # List of context management edits that were applied.
        sig do
          returns(
            T::Array[
              Anthropic::Beta::BetaContextManagementResponse::AppliedEdit::Variants
            ]
          )
        end
        attr_accessor :applied_edits

        sig do
          params(
            applied_edits:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaClearToolUses20250919EditResponse::OrHash,
                  Anthropic::Beta::BetaClearThinking20251015EditResponse::OrHash
                )
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # List of context management edits that were applied.
          applied_edits:
        )
        end

        sig do
          override.returns(
            {
              applied_edits:
                T::Array[
                  Anthropic::Beta::BetaContextManagementResponse::AppliedEdit::Variants
                ]
            }
          )
        end
        def to_hash
        end

        module AppliedEdit
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaClearToolUses20250919EditResponse,
                Anthropic::Beta::BetaClearThinking20251015EditResponse
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::BetaContextManagementResponse::AppliedEdit::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CLEAR_TOOL_USES_20250919 =
              T.let(
                :clear_tool_uses_20250919,
                Anthropic::Beta::BetaContextManagementResponse::AppliedEdit::Type::TaggedSymbol
              )
            CLEAR_THINKING_20251015 =
              T.let(
                :clear_thinking_20251015,
                Anthropic::Beta::BetaContextManagementResponse::AppliedEdit::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::BetaContextManagementResponse::AppliedEdit::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaContextManagementResponse::AppliedEdit::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type: T.any(Symbol, String),
              cleared_input_tokens: Integer,
              cleared_tool_uses: Integer,
              cleared_thinking_turns: Integer
            ).returns(
              Anthropic::Beta::BetaContextManagementResponse::AppliedEdit::Variants
            )
          end
          def self.new(
            type:,
            # Number of input tokens cleared by this edit.
            cleared_input_tokens:,
            # Number of tool uses that were cleared.
            cleared_tool_uses: nil,
            # Number of thinking turns that were cleared.
            cleared_thinking_turns: nil
          )
          end
        end
      end
    end
  end
end
