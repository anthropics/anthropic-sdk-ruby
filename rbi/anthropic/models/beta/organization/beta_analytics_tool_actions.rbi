# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsToolActions < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsToolActions,
                Anthropic::Internal::AnyHash
              )
            end

          # Accepted/rejected counts for a single Claude Code tool type.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaAnalyticsToolActionCounts
            )
          end
          attr_reader :edit_tool

          sig do
            params(
              edit_tool:
                Anthropic::Beta::Organization::BetaAnalyticsToolActionCounts::OrHash
            ).void
          end
          attr_writer :edit_tool

          # Accepted/rejected counts for a single Claude Code tool type.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaAnalyticsToolActionCounts
            )
          end
          attr_reader :multi_edit_tool

          sig do
            params(
              multi_edit_tool:
                Anthropic::Beta::Organization::BetaAnalyticsToolActionCounts::OrHash
            ).void
          end
          attr_writer :multi_edit_tool

          # Accepted/rejected counts for a single Claude Code tool type.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaAnalyticsToolActionCounts
            )
          end
          attr_reader :notebook_edit_tool

          sig do
            params(
              notebook_edit_tool:
                Anthropic::Beta::Organization::BetaAnalyticsToolActionCounts::OrHash
            ).void
          end
          attr_writer :notebook_edit_tool

          # Accepted/rejected counts for a single Claude Code tool type.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaAnalyticsToolActionCounts
            )
          end
          attr_reader :write_tool

          sig do
            params(
              write_tool:
                Anthropic::Beta::Organization::BetaAnalyticsToolActionCounts::OrHash
            ).void
          end
          attr_writer :write_tool

          # Per-tool accepted/rejected counts for Claude Code file modification tools.
          sig do
            params(
              edit_tool:
                Anthropic::Beta::Organization::BetaAnalyticsToolActionCounts::OrHash,
              multi_edit_tool:
                Anthropic::Beta::Organization::BetaAnalyticsToolActionCounts::OrHash,
              notebook_edit_tool:
                Anthropic::Beta::Organization::BetaAnalyticsToolActionCounts::OrHash,
              write_tool:
                Anthropic::Beta::Organization::BetaAnalyticsToolActionCounts::OrHash
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
                edit_tool:
                  Anthropic::Beta::Organization::BetaAnalyticsToolActionCounts,
                multi_edit_tool:
                  Anthropic::Beta::Organization::BetaAnalyticsToolActionCounts,
                notebook_edit_tool:
                  Anthropic::Beta::Organization::BetaAnalyticsToolActionCounts,
                write_tool:
                  Anthropic::Beta::Organization::BetaAnalyticsToolActionCounts
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
