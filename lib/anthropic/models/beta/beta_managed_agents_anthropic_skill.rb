# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAnthropicSkill < Anthropic::Internal::Type::BaseModel
        # @!attribute skill_id
        #
        #   @return [String]
        required :skill_id, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAnthropicSkill::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsAnthropicSkill::Type }

        # @!attribute version
        #
        #   @return [String]
        required :version, String

        # @!method initialize(skill_id:, type:, version:)
        #   A resolved Anthropic-managed skill.
        #
        #   @param skill_id [String]
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAnthropicSkill::Type]
        #   @param version [String]

        # @see Anthropic::Models::Beta::BetaManagedAgentsAnthropicSkill#type
        module Type
          extend Anthropic::Internal::Type::Enum

          ANTHROPIC = :anthropic

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsAnthropicSkill = Beta::BetaManagedAgentsAnthropicSkill
  end
end
