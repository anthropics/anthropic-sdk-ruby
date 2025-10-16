# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaSkillParams < Anthropic::Internal::Type::BaseModel
        # @!attribute skill_id
        #   Skill ID
        #
        #   @return [String]
        required :skill_id, String

        # @!attribute type
        #   Type of skill - either 'anthropic' (built-in) or 'custom' (user-defined)
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaSkillParams::Type]
        required :type, enum: -> { Anthropic::Beta::BetaSkillParams::Type }

        # @!attribute version
        #   Skill version or 'latest' for most recent version
        #
        #   @return [String, nil]
        optional :version, String

        # @!method initialize(skill_id:, type:, version: nil)
        #   Specification for a skill to be loaded in a container (request model).
        #
        #   @param skill_id [String] Skill ID
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaSkillParams::Type] Type of skill - either 'anthropic' (built-in) or 'custom' (user-defined)
        #
        #   @param version [String] Skill version or 'latest' for most recent version

        # Type of skill - either 'anthropic' (built-in) or 'custom' (user-defined)
        #
        # @see Anthropic::Models::Beta::BetaSkillParams#type
        module Type
          extend Anthropic::Internal::Type::Enum

          ANTHROPIC = :anthropic
          CUSTOM = :custom

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaSkillParams = Beta::BetaSkillParams
  end
end
