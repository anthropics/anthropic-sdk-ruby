# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # The settings level a value comes from. More types can be added.
        module BetaClaudeTagSettingSource
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaClaudeTagSlackChannelSettingSource,
                Anthropic::Beta::Organization::BetaClaudeTagSlackWorkspaceSettingSource,
                Anthropic::Beta::Organization::BetaClaudeTagSlackParentChannelSettingSource,
                Anthropic::Beta::Organization::BetaClaudeTagSlackDefaultSettingSource,
                Anthropic::Beta::Organization::BetaClaudeTagDefaultSettingSource,
                Anthropic::Beta::Organization::BetaClaudeTagSlackGridChannelSettingSource
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaClaudeTagSettingSource::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SLACK_CHANNEL =
              T.let(
                :slack_channel,
                Anthropic::Beta::Organization::BetaClaudeTagSettingSource::Type::TaggedSymbol
              )
            SLACK_WORKSPACE =
              T.let(
                :slack_workspace,
                Anthropic::Beta::Organization::BetaClaudeTagSettingSource::Type::TaggedSymbol
              )
            SLACK_PARENT_CHANNEL =
              T.let(
                :slack_parent_channel,
                Anthropic::Beta::Organization::BetaClaudeTagSettingSource::Type::TaggedSymbol
              )
            SLACK_DEFAULT =
              T.let(
                :slack_default,
                Anthropic::Beta::Organization::BetaClaudeTagSettingSource::Type::TaggedSymbol
              )
            DEFAULT =
              T.let(
                :default,
                Anthropic::Beta::Organization::BetaClaudeTagSettingSource::Type::TaggedSymbol
              )
            SLACK_GRID_CHANNEL =
              T.let(
                :slack_grid_channel,
                Anthropic::Beta::Organization::BetaClaudeTagSettingSource::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaClaudeTagSettingSource::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaClaudeTagSettingSource::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type:
                Anthropic::Beta::Organization::BetaClaudeTagSettingSource::Type::OrSymbol,
              slack_channel_id: String,
              slack_workspace_id: String,
              slack:
                Anthropic::Beta::Organization::BetaClaudeTagSlackChannelIdentifiers::OrHash
            ).returns(
              Anthropic::Beta::Organization::BetaClaudeTagSettingSource::Variants
            )
          end
          def self.new(
            type:,
            # The channel's identifier, starting with `slch_`.
            slack_channel_id: nil,
            # The workspace's identifier, starting with `slws_`.
            slack_workspace_id: nil,
            # Slack's own identifiers for the channel under that other workspace.
            slack: nil
          )
          end
        end
      end
    end
  end
end
