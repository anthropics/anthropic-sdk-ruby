# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagSettingsCreate < Anthropic::Internal::Type::BaseModel
          # @!attribute enabled
          #   Whether Claude is on. `true` on a channel turns Claude on in it even when its
          #   workspace stores `false`. Null clears it.
          #
          #   @return [Boolean, nil]
          optional :enabled, Anthropic::Internal::Type::Boolean, nil?: true

          # @!attribute environment_id
          #   The environment Claude's sessions run in: the identifier of an active
          #   environment of the organization, starting with `env_`. Null clears it.
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

          # @!method initialize(enabled: nil, environment_id: nil, guest_policy: nil, instructions: nil, model: nil)
          #   The settings in a request that sets a Slack channel up. A setting left out is
          #   not set. A setting sent as null is cleared.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaClaudeTagSettingsCreate} for more
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
        end
      end
    end
  end
end
