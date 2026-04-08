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
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAgentParams::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsAgentParams::Type }

        # @!attribute version
        #   The specific `agent` version to use. Omit to use the latest version. Must be at
        #   least 1 if specified.
        #
        #   @return [Integer, nil]
        optional :version, Integer

        # @!method initialize(id:, type:, version: nil)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsAgentParams} for more details.
        #
        #   Specification for an Agent. Provide a specific `version` or use the short-form
        #   `agent="agent_id"` for the most recent version
        #
        #   @param id [String] The `agent` ID.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAgentParams::Type]
        #
        #   @param version [Integer] The specific `agent` version to use. Omit to use the latest version. Must be at

        # @see Anthropic::Models::Beta::BetaManagedAgentsAgentParams#type
        module Type
          extend Anthropic::Internal::Type::Enum

          AGENT = :agent

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsAgentParams = Beta::BetaManagedAgentsAgentParams
  end
end
