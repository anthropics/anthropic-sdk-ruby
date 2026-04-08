# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsCustomSkillParams < Anthropic::Internal::Type::BaseModel
        # @!attribute skill_id
        #   Tagged ID of the custom skill (e.g., "skill_01XJ5...").
        #
        #   @return [String]
        required :skill_id, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsCustomSkillParams::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsCustomSkillParams::Type }

        # @!attribute version
        #   Version to pin. Defaults to latest if omitted.
        #
        #   @return [String, nil]
        optional :version, String, nil?: true

        # @!method initialize(skill_id:, type:, version: nil)
        #   A user-created custom skill.
        #
        #   @param skill_id [String] Tagged ID of the custom skill (e.g., "skill_01XJ5...").
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsCustomSkillParams::Type]
        #
        #   @param version [String, nil] Version to pin. Defaults to latest if omitted.

        # @see Anthropic::Models::Beta::BetaManagedAgentsCustomSkillParams#type
        module Type
          extend Anthropic::Internal::Type::Enum

          CUSTOM = :custom

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsCustomSkillParams = Beta::BetaManagedAgentsCustomSkillParams
  end
end
