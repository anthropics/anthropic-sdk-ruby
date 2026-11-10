# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagSettingsUpdate < Anthropic::Internal::Type::BaseModel
          # @!attribute enabled
          #   Whether Claude is on. `true` on a channel turns Claude on in it even when its
          #   workspace stores `false`. Null clears it.
          #
          #   @return [Boolean, nil]
          optional :enabled, Anthropic::Internal::Type::Boolean, nil?: true

          # @!attribute environment_id
          #   The environment Claude's sessions run in: the identifier of an active
          #   environment of the organization, starting with `env_`, or of a self-hosted
          #   runner pool of the organization that every member may use, starting with
          #   `ccpool_`. Null clears it.
          #
          #   @return [String, nil]
          optional :environment_id, String, nil?: true

          # @!attribute guest_policy
          #   What Claude does in a channel while a Slack guest is in it. Null clears it.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaClaudeTagGuestPolicyAllow, Anthropic::Models::Beta::Organization::BetaClaudeTagGuestPolicyRestrict, Anthropic::Models::Beta::Organization::BetaClaudeTagGuestPolicyChannelOnly, nil]
          optional :guest_policy,
                   union: -> {
                     Anthropic::Beta::Organization::BetaClaudeTagGuestPolicy
                   },
                   nil?: true

          # @!attribute instructions
          #   Instructions for Claude, up to 8,192 characters after leading and trailing white
          #   space is trimmed. Null or blank text clears them.
          #
          #   @return [String, nil]
          optional :instructions, String, nil?: true

          # @!attribute model
          #   The model Claude uses: the identifier of a model, or the name of a model line,
          #   that the organization is entitled to for Claude Tag. Null clears it.
          #
          #   @return [String, nil]
          optional :model, String, nil?: true

          # @!attribute reply_mode
          #   How Claude takes part in the channel: `automatic`, `mention_only`,
          #   `always_awake` or `thread`. Only a channel takes one: an update of a workspace
          #   that sends a value is refused, and one that sends null changes nothing. Null
          #   never clears it: sent to a channel that stores none it changes nothing, and sent
          #   to a channel that stores one it is refused, because a stored reply mode can be
          #   changed but never cleared; a caller that wants Claude's default behavior sends
          #   `automatic`.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaClaudeTagReplyModeAutomatic, Anthropic::Models::Beta::Organization::BetaClaudeTagReplyModeMentionOnly, Anthropic::Models::Beta::Organization::BetaClaudeTagReplyModeAlwaysAwake, Anthropic::Models::Beta::Organization::BetaClaudeTagReplyModeThread, nil]
          optional :reply_mode,
                   union: -> {
                     Anthropic::Beta::Organization::BetaClaudeTagReplyMode
                   },
                   nil?: true

          # @!method initialize(enabled: nil, environment_id: nil, guest_policy: nil, instructions: nil, model: nil, reply_mode: nil)
          #   The settings to change. A setting left out is unchanged. A setting sent as null
          #   is cleared, so it is inherited.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaClaudeTagSettingsUpdate} for more
          #   details.
          #
          #   @param enabled [Boolean, nil] Whether Claude is on. `true` on a channel turns Claude on in it even when its wo
          #
          #   @param environment_id [String, nil] The environment Claude's sessions run in: the identifier of an active environmen
          #
          #   @param guest_policy [Anthropic::Models::Beta::Organization::BetaClaudeTagGuestPolicyAllow, Anthropic::Models::Beta::Organization::BetaClaudeTagGuestPolicyRestrict, Anthropic::Models::Beta::Organization::BetaClaudeTagGuestPolicyChannelOnly, nil] What Claude does in a channel while a Slack guest is in it. Null clears it.
          #
          #   @param instructions [String, nil] Instructions for Claude, up to 8,192 characters after leading and trailing white
          #
          #   @param model [String, nil] The model Claude uses: the identifier of a model, or the name of a model line, t
          #
          #   @param reply_mode [Anthropic::Models::Beta::Organization::BetaClaudeTagReplyModeAutomatic, Anthropic::Models::Beta::Organization::BetaClaudeTagReplyModeMentionOnly, Anthropic::Models::Beta::Organization::BetaClaudeTagReplyModeAlwaysAwake, Anthropic::Models::Beta::Organization::BetaClaudeTagReplyModeThread, nil] How Claude takes part in the channel: `automatic`, `mention_only`,
        end
      end
    end
  end
end
