# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagSettingSources < Anthropic::Internal::Type::BaseModel
          # @!attribute enabled
          #   The settings level `enabled` comes from.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaClaudeTagSlackChannelSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackWorkspaceSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackParentChannelSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackDefaultSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagDefaultSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackGridChannelSettingSource, nil]
          required :enabled,
                   union: -> {
                     Anthropic::Beta::Organization::BetaClaudeTagSettingSource
                   },
                   nil?: true

          # @!attribute environment_id
          #   The settings level `environment_id` comes from.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaClaudeTagSlackChannelSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackWorkspaceSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackParentChannelSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackDefaultSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagDefaultSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackGridChannelSettingSource, nil]
          required :environment_id,
                   union: -> { Anthropic::Beta::Organization::BetaClaudeTagSettingSource },
                   nil?: true

          # @!attribute guest_policy
          #   The settings level `guest_policy` comes from.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaClaudeTagSlackChannelSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackWorkspaceSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackParentChannelSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackDefaultSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagDefaultSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackGridChannelSettingSource, nil]
          required :guest_policy,
                   union: -> { Anthropic::Beta::Organization::BetaClaudeTagSettingSource },
                   nil?: true

          # @!attribute instructions
          #   Every settings level that contributes text to `instructions`, broadest first, in
          #   the order their text is joined. Empty when none does.
          #
          #   @return [Array<Anthropic::Models::Beta::Organization::BetaClaudeTagSlackChannelSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackWorkspaceSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackParentChannelSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackDefaultSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagDefaultSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackGridChannelSettingSource>]
          required :instructions,
                   -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::Organization::BetaClaudeTagSettingSource] }

          # @!attribute model
          #   The settings level `model` comes from.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaClaudeTagSlackChannelSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackWorkspaceSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackParentChannelSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackDefaultSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagDefaultSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackGridChannelSettingSource, nil]
          required :model, union: -> { Anthropic::Beta::Organization::BetaClaudeTagSettingSource }, nil?: true

          # @!method initialize(enabled:, environment_id:, guest_policy:, instructions:, model:)
          #   For each setting, the settings level its value in `settings` comes from. Without
          #   `include_inherited`, a setting the channel or workspace stores has a source that
          #   names the channel or workspace itself, and one it does not store has null, or an
          #   empty list for `instructions`. With `include_inherited=true` no member is null:
          #   a value that no settings level sets has the source `default`.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaClaudeTagSettingSources} for more
          #   details.
          #
          #   @param enabled [Anthropic::Models::Beta::Organization::BetaClaudeTagSlackChannelSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackWorkspaceSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackParentChannelSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackDefaultSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagDefaultSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackGridChannelSettingSource, nil] The settings level `enabled` comes from.
          #
          #   @param environment_id [Anthropic::Models::Beta::Organization::BetaClaudeTagSlackChannelSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackWorkspaceSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackParentChannelSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackDefaultSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagDefaultSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackGridChannelSettingSource, nil] The settings level `environment_id` comes from.
          #
          #   @param guest_policy [Anthropic::Models::Beta::Organization::BetaClaudeTagSlackChannelSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackWorkspaceSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackParentChannelSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackDefaultSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagDefaultSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackGridChannelSettingSource, nil] The settings level `guest_policy` comes from.
          #
          #   @param instructions [Array<Anthropic::Models::Beta::Organization::BetaClaudeTagSlackChannelSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackWorkspaceSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackParentChannelSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackDefaultSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagDefaultSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackGridChannelSettingSource>] Every settings level that contributes text to `instructions`, broadest first, in
          #
          #   @param model [Anthropic::Models::Beta::Organization::BetaClaudeTagSlackChannelSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackWorkspaceSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackParentChannelSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackDefaultSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagDefaultSettingSource, Anthropic::Models::Beta::Organization::BetaClaudeTagSlackGridChannelSettingSource, nil] The settings level `model` comes from.
        end
      end
    end
  end
end
