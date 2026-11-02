# typed: strong

module Anthropic
  module Models
    module Organization
      class AnalyticsToolActions < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::AnalyticsToolActions,
              Anthropic::Internal::AnyHash
            )
          end

        # Accepted/rejected counts for a single Claude Code tool type.
        sig { returns(Anthropic::Organization::AnalyticsToolActionCounts) }
        attr_reader :edit_tool

        sig do
          params(
            edit_tool:
              Anthropic::Organization::AnalyticsToolActionCounts::OrHash
          ).void
        end
        attr_writer :edit_tool

        # Accepted/rejected counts for a single Claude Code tool type.
        sig { returns(Anthropic::Organization::AnalyticsToolActionCounts) }
        attr_reader :multi_edit_tool

        sig do
          params(
            multi_edit_tool:
              Anthropic::Organization::AnalyticsToolActionCounts::OrHash
          ).void
        end
        attr_writer :multi_edit_tool

        # Accepted/rejected counts for a single Claude Code tool type.
        sig { returns(Anthropic::Organization::AnalyticsToolActionCounts) }
        attr_reader :notebook_edit_tool

        sig do
          params(
            notebook_edit_tool:
              Anthropic::Organization::AnalyticsToolActionCounts::OrHash
          ).void
        end
        attr_writer :notebook_edit_tool

        # Accepted/rejected counts for a single Claude Code tool type.
        sig { returns(Anthropic::Organization::AnalyticsToolActionCounts) }
        attr_reader :write_tool

        sig do
          params(
            write_tool:
              Anthropic::Organization::AnalyticsToolActionCounts::OrHash
          ).void
        end
        attr_writer :write_tool

        # Per-tool accepted/rejected counts for Claude Code file modification tools.
        sig do
          params(
            edit_tool:
              Anthropic::Organization::AnalyticsToolActionCounts::OrHash,
            multi_edit_tool:
              Anthropic::Organization::AnalyticsToolActionCounts::OrHash,
            notebook_edit_tool:
              Anthropic::Organization::AnalyticsToolActionCounts::OrHash,
            write_tool:
              Anthropic::Organization::AnalyticsToolActionCounts::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Accepted/rejected counts for a single Claude Code tool type.
          edit_tool:,
          # Accepted/rejected counts for a single Claude Code tool type.
          multi_edit_tool:,
          # Accepted/rejected counts for a single Claude Code tool type.
          notebook_edit_tool:,
          # Accepted/rejected counts for a single Claude Code tool type.
          write_tool:
        )
        end

        sig do
          override.returns(
            {
              edit_tool: Anthropic::Organization::AnalyticsToolActionCounts,
              multi_edit_tool:
                Anthropic::Organization::AnalyticsToolActionCounts,
              notebook_edit_tool:
                Anthropic::Organization::AnalyticsToolActionCounts,
              write_tool: Anthropic::Organization::AnalyticsToolActionCounts
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
