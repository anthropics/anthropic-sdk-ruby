# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # The settings level a value comes from. More types can be added.
        module BetaClaudeTagSettingSource
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # The value comes from the addressed Slack channel itself.
          variant :slack_channel, -> { Anthropic::Beta::Organization::BetaClaudeTagSlackChannelSettingSource }

          # The value comes from a Slack workspace of the organization.
          variant :slack_workspace, -> { Anthropic::Beta::Organization::BetaClaudeTagSlackWorkspaceSettingSource }

          # The value comes from the channel that a code channel was started from. A parent channel contributes `instructions` and `environment_id` only.
          variant :slack_parent_channel,
                  -> { Anthropic::Beta::Organization::BetaClaudeTagSlackParentChannelSettingSource }

          # The value comes from the organization's Slack defaults, which have no identifier.
          variant :slack_default, -> { Anthropic::Beta::Organization::BetaClaudeTagSlackDefaultSettingSource }

          # No settings level sets a value, and the built-in default applies.
          variant :default, -> { Anthropic::Beta::Organization::BetaClaudeTagDefaultSettingSource }

          # The value comes from the addressed channel as it is set up under another workspace of its Enterprise Grid: a channel shared across the Grid keeps one Slack channel identifier in every workspace that sees it.
          variant :slack_grid_channel,
                  -> { Anthropic::Beta::Organization::BetaClaudeTagSlackGridChannelSettingSource }

          module Type
            extend Anthropic::Internal::Type::Enum

            SLACK_CHANNEL = :slack_channel
            SLACK_WORKSPACE = :slack_workspace
            SLACK_PARENT_CHANNEL = :slack_parent_channel
            SLACK_DEFAULT = :slack_default
            DEFAULT = :default
            SLACK_GRID_CHANNEL = :slack_grid_channel

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Organization::BetaClaudeTagSlackChannelSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackWorkspaceSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackParentChannelSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackDefaultSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagDefaultSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackGridChannelSettingSource)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, Anthropic::Models::Beta::Organization::BetaClaudeTagSettingSource::Type, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :slack_channel_id The channel's identifier, starting with `slch_`.
          #
          #   @option args [String] :slack_workspace_id The workspace's identifier, starting with `slws_`.
          #
          #   @option args [Anthropic::Models::Beta::Organization::BetaClaudeTagSlackChannelIdentifiers] :slack Slack's own identifiers for the channel under that other workspace.
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::Organization::BetaClaudeTagSlackChannelSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackWorkspaceSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackParentChannelSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackDefaultSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagDefaultSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackGridChannelSettingSource]
          def self.new(type:, **args)
            case type.to_sym
            when :slack_channel
              Anthropic::Beta::Organization::BetaClaudeTagSlackChannelSettingSource.new(**args)
            when :slack_workspace
              Anthropic::Beta::Organization::BetaClaudeTagSlackWorkspaceSettingSource.new(**args)
            when :slack_parent_channel
              Anthropic::Beta::Organization::BetaClaudeTagSlackParentChannelSettingSource.new(**args)
            when :slack_default
              Anthropic::Beta::Organization::BetaClaudeTagSlackDefaultSettingSource.new(**args)
            when :default
              Anthropic::Beta::Organization::BetaClaudeTagDefaultSettingSource.new(**args)
            when :slack_grid_channel
              Anthropic::Beta::Organization::BetaClaudeTagSlackGridChannelSettingSource.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
