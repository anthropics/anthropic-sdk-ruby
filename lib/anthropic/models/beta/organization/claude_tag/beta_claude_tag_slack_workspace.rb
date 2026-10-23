# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          # @see Anthropic::Resources::Beta::Organization::ClaudeTag::SlackWorkspaces#retrieve
          class BetaClaudeTagSlackWorkspace < Anthropic::Internal::Type::BaseModel
            # @!attribute id
            #   The workspace's identifier. Starts with `slws_`. It does not change for as long
            #   as the workspace is set up. A workspace that is removed and set up again has a
            #   new one, and the old one keeps returning 404; look the workspace up by its Slack
            #   identifier for the new one.
            #
            #   @return [String]
            required :id, String

            # @!attribute created_at
            #   Time the workspace was set up, by whichever route. It does not change for as
            #   long as `id` does not.
            #
            #   @return [Time]
            required :created_at, Time

            # @!attribute settings
            #   What the workspace itself stores or, with `include_inherited`, what applies in
            #   it. `sources` says which.
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaClaudeTagSettings]
            required :settings, -> { Anthropic::Beta::Organization::BetaClaudeTagSettings }

            # @!attribute slack
            #   Slack's own identifier for the workspace.
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaClaudeTagSlackWorkspaceIdentifiers]
            required :slack, -> { Anthropic::Beta::Organization::BetaClaudeTagSlackWorkspaceIdentifiers }

            # @!attribute sources
            #   For each setting, the settings level its value in `settings` comes from.
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaClaudeTagSettingSources]
            required :sources, -> { Anthropic::Beta::Organization::BetaClaudeTagSettingSources }

            # @!attribute type
            #
            #   @return [Symbol, :slack_workspace]
            required :type, const: :slack_workspace

            # @!attribute updated_at
            #   Time Claude Tag's record of the workspace last changed. It moves on every change
            #   to a setting, and can also move when something no response holds changes, so a
            #   later value says to read the workspace again, not that a setting changed.
            #   Attaching or detaching a Bundle does not by itself move it.
            #
            #   @return [Time]
            required :updated_at, Time

            # @!method initialize(id:, created_at:, settings:, slack:, sources:, updated_at:, type: :slack_workspace)
            #   A Slack workspace the organization has connected, itself or through its Slack
            #   Enterprise Grid, with the settings it stores or, with `include_inherited`, the
            #   settings that apply in it.
            #
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::ClaudeTag::BetaClaudeTagSlackWorkspace}
            #   for more details.
            #
            #   @param id [String] The workspace's identifier. Starts with `slws_`. It does not change for as long
            #
            #   @param created_at [Time] Time the workspace was set up, by whichever route. It does not change for as lon
            #
            #   @param settings [Anthropic::Models::Beta::Organization::BetaClaudeTagSettings] What the workspace itself stores or, with `include_inherited`, what applies in i
            #
            #   @param slack [Anthropic::Models::Beta::Organization::BetaClaudeTagSlackWorkspaceIdentifiers] Slack's own identifier for the workspace.
            #
            #   @param sources [Anthropic::Models::Beta::Organization::BetaClaudeTagSettingSources] For each setting, the settings level its value in `settings` comes from.
            #
            #   @param updated_at [Time] Time Claude Tag's record of the workspace last changed. It moves on every change
            #
            #   @param type [Symbol, :slack_workspace]
          end
        end
      end
    end
  end
end
