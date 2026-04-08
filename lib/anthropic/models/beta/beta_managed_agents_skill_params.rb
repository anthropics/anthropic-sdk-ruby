# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Skill to load in the session container.
      module BetaManagedAgentsSkillParams
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # An Anthropic-managed skill.
        variant :anthropic, -> { Anthropic::Beta::BetaManagedAgentsAnthropicSkillParams }

        # A user-created custom skill.
        variant :custom, -> { Anthropic::Beta::BetaManagedAgentsCustomSkillParams }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsAnthropicSkillParams, Anthropic::Models::Beta::BetaManagedAgentsCustomSkillParams)]
      end
    end

    BetaManagedAgentsSkillParams = Beta::BetaManagedAgentsSkillParams
  end
end
