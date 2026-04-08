# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Agents#retrieve
      class AgentRetrieveParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute agent_id
        #
        #   @return [String]
        required :agent_id, String

        # @!attribute version
        #   Agent version. Omit for the most recent version. Must be at least 1 if
        #   specified.
        #
        #   @return [Integer, nil]
        optional :version, Integer

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(agent_id:, version: nil, betas: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::AgentRetrieveParams} for more details.
        #
        #   @param agent_id [String]
        #
        #   @param version [Integer] Agent version. Omit for the most recent version. Must be at least 1 if specified
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
