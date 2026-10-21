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
        #   @return [Symbol, :anthropic]
        required :type, const: :anthropic

        # @!attribute version
        #   Version to pin. Defaults to latest if omitted.
        #
        #   @return [String, nil]
        optional :version, String, nil?: true

        # @!method initialize(skill_id:, version: nil, type: :anthropic)
        #   An Anthropic-managed skill.
        #
        #   @param skill_id [String] Identifier of the Anthropic skill (e.g., "xlsx").
        #
        #   @param version [String, nil] Version to pin. Defaults to latest if omitted.
        #
        #   @param type [Symbol, :anthropic]
      end
    end

    BetaManagedAgentsAnthropicSkillParams = Beta::BetaManagedAgentsAnthropicSkillParams
  end
end
