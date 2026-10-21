# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAgentParams < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   The `agent` ID.
        #
        #   @return [String]
        required :id, String

        # @!attribute type
        #
        #   @return [Symbol, :agent]
        required :type, const: :agent

        # @!attribute version
        #   The specific `agent` version to use. Omit to use the latest version. Must be at
        #   least 1 if specified.
        #
        #   @return [Integer, nil]
        optional :version, Integer

        # @!method initialize(id:, version: nil, type: :agent)
        #   Specification for an Agent. Provide a specific `version` or use the short-form
        #   `agent="agent_id"` for the most recent version
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsAgentParams} for more details.
        #
        #   @param id [String] The `agent` ID.
        #
        #   @param version [Integer] The specific `agent` version to use. Omit to use the latest version. Must be at
        #
        #   @param type [Symbol, :agent]
      end
    end

    BetaManagedAgentsAgentParams = Beta::BetaManagedAgentsAgentParams
  end
end
