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
        #   @return [Symbol, :custom]
        required :type, const: :custom

        # @!attribute version
        #
        #   @return [String]
        required :version, String

        # @!method initialize(skill_id:, version:, type: :custom)
        #   A resolved user-created custom skill.
        #
        #   @param skill_id [String]
        #   @param version [String]
        #   @param type [Symbol, :custom]
      end
    end

    BetaManagedAgentsCustomSkill = Beta::BetaManagedAgentsCustomSkill
  end
end
