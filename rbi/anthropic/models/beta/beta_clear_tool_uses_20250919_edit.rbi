# typed: strong

module Anthropic
  module Models
    BetaClearToolUses20250919Edit = Beta::BetaClearToolUses20250919Edit

    module Beta
      class BetaClearToolUses20250919Edit < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaClearToolUses20250919Edit,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # Minimum number of tokens that must be cleared when triggered. Context will only
        # be modified if at least this many tokens can be removed.
        sig { returns(T.nilable(Anthropic::Beta::BetaInputTokensClearAtLeast)) }
        attr_reader :clear_at_least

        sig do
          params(
            clear_at_least:
              T.nilable(Anthropic::Beta::BetaInputTokensClearAtLeast::OrHash)
          ).void
        end
        attr_writer :clear_at_least

        # Whether to clear all tool inputs (bool) or specific tool inputs to clear (list)
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaClearToolUses20250919Edit::ClearToolInputs::Variants
            )
          )
        end
        attr_accessor :clear_tool_inputs

        # Tool names whose uses are preserved from clearing
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :exclude_tools

        # Number of tool uses to retain in the conversation
        sig { returns(T.nilable(Anthropic::Beta::BetaToolUsesKeep)) }
        attr_reader :keep

        sig { params(keep: Anthropic::Beta::BetaToolUsesKeep::OrHash).void }
        attr_writer :keep

        # Condition that triggers the context management strategy
        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Beta::BetaInputTokensTrigger,
                Anthropic::Beta::BetaToolUsesTrigger
              )
            )
          )
        end
        attr_reader :trigger

        sig do
          params(
            trigger:
              T.any(
                Anthropic::Beta::BetaInputTokensTrigger::OrHash,
                Anthropic::Beta::BetaToolUsesTrigger::OrHash
              )
          ).void
        end
        attr_writer :trigger

        sig do
          params(
            clear_at_least:
              T.nilable(Anthropic::Beta::BetaInputTokensClearAtLeast::OrHash),
            clear_tool_inputs:
              T.nilable(
                Anthropic::Beta::BetaClearToolUses20250919Edit::ClearToolInputs::Variants
              ),
            exclude_tools: T.nilable(T::Array[String]),
            keep: Anthropic::Beta::BetaToolUsesKeep::OrHash,
            trigger:
              T.any(
                Anthropic::Beta::BetaInputTokensTrigger::OrHash,
                Anthropic::Beta::BetaToolUsesTrigger::OrHash
              ),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
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
          type: :clear_tool_uses_20250919
        )
        end

        sig do
          override.returns(
            {
              type: Symbol,
              clear_at_least:
                T.nilable(Anthropic::Beta::BetaInputTokensClearAtLeast),
              clear_tool_inputs:
                T.nilable(
                  Anthropic::Beta::BetaClearToolUses20250919Edit::ClearToolInputs::Variants
                ),
              exclude_tools: T.nilable(T::Array[String]),
              keep: Anthropic::Beta::BetaToolUsesKeep,
              trigger:
                T.any(
                  Anthropic::Beta::BetaInputTokensTrigger,
                  Anthropic::Beta::BetaToolUsesTrigger
                )
            }
          )
        end
        def to_hash
        end

        # Whether to clear all tool inputs (bool) or specific tool inputs to clear (list)
        module ClearToolInputs
          extend Anthropic::Internal::Type::Union

          Variants = T.type_alias { T.any(T::Boolean, T::Array[String]) }

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaClearToolUses20250919Edit::ClearToolInputs::Variants
              ]
            )
          end
          def self.variants
          end

          StringArray =
            T.let(
              Anthropic::Internal::Type::ArrayOf[String],
              Anthropic::Internal::Type::Converter
            )
        end

        # Condition that triggers the context management strategy
        module Trigger
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaInputTokensTrigger,
                Anthropic::Beta::BetaToolUsesTrigger
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaClearToolUses20250919Edit::Trigger::Variants
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
