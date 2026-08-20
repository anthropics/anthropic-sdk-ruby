# typed: strong

module Anthropic
  module Models
    BetaContextManagementConfig = Beta::BetaContextManagementConfig

    module Beta
      class BetaContextManagementConfig < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaContextManagementConfig,
              Anthropic::Internal::AnyHash
            )
          end

        # List of context management edits to apply
        sig do
          returns(
            T.nilable(
              T::Array[
                T.any(
                  Anthropic::Beta::BetaClearToolUses20250919Edit,
                  Anthropic::Beta::BetaClearThinking20251015Edit,
                  Anthropic::Beta::BetaCompact20260112Edit
                )
              ]
            )
          )
        end
        attr_reader :edits

        sig do
          params(
            edits:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaClearToolUses20250919Edit::OrHash,
                  Anthropic::Beta::BetaClearThinking20251015Edit::OrHash,
                  Anthropic::Beta::BetaCompact20260112Edit::OrHash
                )
              ]
          ).void
        end
        attr_writer :edits

        sig do
          params(
            edits:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaClearToolUses20250919Edit::OrHash,
                  Anthropic::Beta::BetaClearThinking20251015Edit::OrHash,
                  Anthropic::Beta::BetaCompact20260112Edit::OrHash
                )
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # List of context management edits to apply
          edits: nil
        )
        end

        sig do
          override.returns(
            {
              edits:
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaClearToolUses20250919Edit,
                    Anthropic::Beta::BetaClearThinking20251015Edit,
                    Anthropic::Beta::BetaCompact20260112Edit
                  )
                ]
            }
          )
        end
        def to_hash
        end

        # Automatically compact older context when reaching the configured trigger
        # threshold.
        module Edit
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaClearToolUses20250919Edit,
                Anthropic::Beta::BetaClearThinking20251015Edit,
                Anthropic::Beta::BetaCompact20260112Edit
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::BetaContextManagementConfig::Edit::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CLEAR_TOOL_USES_20250919 =
              T.let(
                :clear_tool_uses_20250919,
                Anthropic::Beta::BetaContextManagementConfig::Edit::Type::TaggedSymbol
              )
            CLEAR_THINKING_20251015 =
              T.let(
                :clear_thinking_20251015,
                Anthropic::Beta::BetaContextManagementConfig::Edit::Type::TaggedSymbol
              )
            COMPACT_20260112 =
              T.let(
                :compact_20260112,
                Anthropic::Beta::BetaContextManagementConfig::Edit::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::BetaContextManagementConfig::Edit::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaContextManagementConfig::Edit::Variants
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
              clear_at_least:
                T.nilable(Anthropic::Beta::BetaInputTokensClearAtLeast::OrHash),
              clear_tool_inputs:
                T.nilable(
                  Anthropic::Beta::BetaClearToolUses20250919Edit::ClearToolInputs::Variants
                ),
              exclude_tools: T.nilable(T::Array[String]),
              keep:
                T.any(
                  Anthropic::Beta::BetaToolUsesKeep::OrHash,
                  T.any(
                    Anthropic::Beta::BetaThinkingTurns::OrHash,
                    Anthropic::Beta::BetaAllThinkingTurns::OrHash,
                    Symbol
                  )
                ),
              trigger:
                T.any(
                  T.any(
                    Anthropic::Beta::BetaInputTokensTrigger::OrHash,
                    Anthropic::Beta::BetaToolUsesTrigger::OrHash
                  ),
                  T.nilable(Anthropic::Beta::BetaInputTokensTrigger::OrHash)
                ),
              instructions: T.nilable(String),
              pause_after_compaction: T::Boolean
            ).returns(
              Anthropic::Beta::BetaContextManagementConfig::Edit::Variants
            )
          end
          def self.new(
            type:,
            # Minimum number of tokens that must be cleared when triggered. Context will only
            # be modified if at least this many tokens can be removed.
            clear_at_least: nil,
            # Whether to clear all tool inputs (bool) or specific tool inputs to clear (list)
            clear_tool_inputs: nil,
            # Tool names whose uses are preserved from clearing
            exclude_tools: nil,
            # Number of tool uses to retain in the conversation
            keep: nil,
            # Condition that triggers the context management strategy
            trigger: nil,
            # Additional instructions for summarization.
            instructions: nil,
            # Whether to pause after compaction and return the compaction block to the user.
            pause_after_compaction: nil
          )
          end
        end
      end
    end
  end
end
