# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAnthropicSkillParams < Anthropic::Internal::Type::BaseModel
        # @!attribute skill_id
        #   Identifier of the Anthropic skill (e.g., "xlsx").
        #
        #   @return [String]
        required :skill_id, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAnthropicSkillParams::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsAnthropicSkillParams::Type }

        # @!attribute version
        #   Version to pin. Defaults to latest if omitted.
        #
        #   @return [String, nil]
        optional :version, String, nil?: true

        # @!method initialize(skill_id:, type:, version: nil)
        #   An Anthropic-managed skill.
        #
        #   @param skill_id [String] Identifier of the Anthropic skill (e.g., "xlsx").
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAnthropicSkillParams::Type]
        #
        #   @param version [String, nil] Version to pin. Defaults to latest if omitted.

        # @see Anthropic::Models::Beta::BetaManagedAgentsAnthropicSkillParams#type
        module Type
          extend Anthropic::Internal::Type::Enum

          ANTHROPIC = :anthropic

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsAnthropicSkillParams = Beta::BetaManagedAgentsAnthropicSkillParams
  end
end
