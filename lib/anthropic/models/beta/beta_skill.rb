# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaSkill < Anthropic::Internal::Type::BaseModel
        # @!attribute skill_id
        #   Skill ID
        #
        #   @return [String]
        required :skill_id, String

        # @!attribute type
        #   Type of skill - either 'anthropic' (built-in) or 'custom' (user-defined)
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaSkill::Type]
        required :type, enum: -> { Anthropic::Beta::BetaSkill::Type }

        # @!attribute version
        #   Skill version or 'latest' for most recent version
        #
        #   @return [String]
        required :version, String

        # @!method initialize(skill_id:, type:, version:)
        #   A skill that was loaded in a container (response model).
        #
        #   @param skill_id [String] Skill ID
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaSkill::Type] Type of skill - either 'anthropic' (built-in) or 'custom' (user-defined)
        #
        #   @param version [String] Skill version or 'latest' for most recent version

        # Type of skill - either 'anthropic' (built-in) or 'custom' (user-defined)
        #
        # @see Anthropic::Models::Beta::BetaSkill#type
        module Type
          extend Anthropic::Internal::Type::Enum

          ANTHROPIC = :anthropic
          CUSTOM = :custom

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaSkill = Beta::BetaSkill
  end
end
