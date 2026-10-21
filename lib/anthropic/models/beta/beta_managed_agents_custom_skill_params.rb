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
        #   @return [Symbol, :custom]
        required :type, const: :custom

        # @!attribute version
        #   Version to pin. Defaults to latest if omitted.
        #
        #   @return [String, nil]
        optional :version, String, nil?: true

        # @!method initialize(skill_id:, version: nil, type: :custom)
        #   A user-created custom skill.
        #
        #   @param skill_id [String] Tagged ID of the custom skill (e.g., "skill_01XJ5...").
        #
        #   @param version [String, nil] Version to pin. Defaults to latest if omitted.
        #
        #   @param type [Symbol, :custom]
      end
    end

    BetaManagedAgentsCustomSkillParams = Beta::BetaManagedAgentsCustomSkillParams
  end
end
