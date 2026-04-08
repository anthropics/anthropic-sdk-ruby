# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsCustomSkill < Anthropic::Internal::Type::BaseModel
        # @!attribute skill_id
        #
        #   @return [String]
        required :skill_id, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsCustomSkill::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsCustomSkill::Type }

        # @!attribute version
        #
        #   @return [String]
        required :version, String

        # @!method initialize(skill_id:, type:, version:)
        #   A resolved user-created custom skill.
        #
        #   @param skill_id [String]
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsCustomSkill::Type]
        #   @param version [String]

        # @see Anthropic::Models::Beta::BetaManagedAgentsCustomSkill#type
        module Type
          extend Anthropic::Internal::Type::Enum

          CUSTOM = :custom

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsCustomSkill = Beta::BetaManagedAgentsCustomSkill
  end
end
