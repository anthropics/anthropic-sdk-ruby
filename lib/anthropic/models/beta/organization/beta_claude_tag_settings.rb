# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagSettings < Anthropic::Internal::Type::BaseModel
          # @!attribute enabled
          #   Whether Claude is on. The nearest settings level that sets it decides.
          #
          #   @return [Boolean, nil]
          required :enabled, Anthropic::Internal::Type::Boolean, nil?: true

          # @!attribute environment_id
          #   The environment Claude's sessions run in, starting with `env_`, or the
          #   identifier of a self-hosted runner pool, starting with `ccpool_`. The nearest
          #   settings level that sets it decides.
          #
          #   @return [String, nil]
          required :environment_id, String, nil?: true

          # @!attribute guest_policy
          #   What Claude does in a channel while a Slack guest is in it. The nearest settings
          #   level that sets it decides.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaClaudeTagGuestPolicyAllow, Anthropic::Models::Beta::Organization::BetaClaudeTagGuestPolicyRestrict, Anthropic::Models::Beta::Organization::BetaClaudeTagGuestPolicyChannelOnly, nil]
          required :guest_policy,
                   union: -> {
                     Anthropic::Beta::Organization::BetaClaudeTagGuestPolicy
                   },
                   nil?: true

          # @!attribute instructions
          #   Instructions for Claude. Instructions add up: the text of every settings level
          #   that sets it is joined, broadest first.
          #
          #   @return [String, nil]
          required :instructions, String, nil?: true

          # @!attribute model
          #   The model Claude uses: a model identifier or the name of a model line. The
          #   nearest settings level that sets it decides. When none does, Claude uses the
          #   product's default model.
          #
          #   @return [String, nil]
          required :model, String, nil?: true

          # @!method initialize(enabled:, environment_id:, guest_policy:, instructions:, model:)
          #   Claude Tag settings. Without `include_inherited`, a setting that is null is not
          #   set on the settings level and is inherited. With it, `enabled` and
          #   `guest_policy` are never null, and `instructions`, `model` and `environment_id`
          #   are null when no settings level sets them.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaClaudeTagSettings} for more details.
          #
          #   @param enabled [Boolean, nil] Whether Claude is on. The nearest settings level that sets it decides.
          #
          #   @param environment_id [String, nil] The environment Claude's sessions run in, starting with `env_`, or the identifie
          #
          #   @param guest_policy [Anthropic::Models::Beta::Organization::BetaClaudeTagGuestPolicyAllow, Anthropic::Models::Beta::Organization::BetaClaudeTagGuestPolicyRestrict, Anthropic::Models::Beta::Organization::BetaClaudeTagGuestPolicyChannelOnly, nil] What Claude does in a channel while a Slack guest is in it. The nearest settings
          #
          #   @param instructions [String, nil] Instructions for Claude. Instructions add up: the text of every settings level t
          #
          #   @param model [String, nil] The model Claude uses: a model identifier or the name of a model line. The neare
        end
      end
    end
  end
end
