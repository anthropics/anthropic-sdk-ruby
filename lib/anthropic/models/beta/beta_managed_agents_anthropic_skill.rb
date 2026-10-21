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
        #   @return [Symbol, :anthropic]
        required :type, const: :anthropic

        # @!attribute version
        #
        #   @return [String]
        required :version, String

        # @!method initialize(skill_id:, version:, type: :anthropic)
        #   A resolved Anthropic-managed skill.
        #
        #   @param skill_id [String]
        #   @param version [String]
        #   @param type [Symbol, :anthropic]
      end
    end

    BetaManagedAgentsAnthropicSkill = Beta::BetaManagedAgentsAnthropicSkill
  end
end
