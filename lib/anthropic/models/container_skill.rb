# frozen_string_literal: true

module Anthropic
  module Models
    class ContainerSkill < Anthropic::Internal::Type::BaseModel
      # @!attribute skill_id
      #   Skill ID
      #
      #   @return [String]
      required :skill_id, String

      # @!attribute type
      #   Type of skill - either 'anthropic' (built-in) or 'custom' (user-defined)
      #
      #   @return [Symbol, Anthropic::Models::ContainerSkill::Type]
      required :type, enum: -> { Anthropic::ContainerSkill::Type }

      # @!attribute version
      #   The resolved version: a skill version ID for custom skills.
      #
      #   @return [String]
      required :version, String

      # @!method initialize(skill_id:, type:, version:)
      #   A skill that was loaded in a container (response model).
      #
      #   @param skill_id [String] Skill ID
      #
      #   @param type [Symbol, Anthropic::Models::ContainerSkill::Type] Type of skill - either 'anthropic' (built-in) or 'custom' (user-defined)
      #
      #   @param version [String] The resolved version: a skill version ID for custom skills.

      # Type of skill - either 'anthropic' (built-in) or 'custom' (user-defined)
      #
      # @see Anthropic::Models::ContainerSkill#type
      module Type
        extend Anthropic::Internal::Type::Enum

        ANTHROPIC = :anthropic
        CUSTOM = :custom

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
