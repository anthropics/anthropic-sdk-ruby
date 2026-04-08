# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Agents
        # @see Anthropic::Resources::Beta::Agents::Versions#list
        class VersionListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute agent_id
          #
          #   @return [String]
          required :agent_id, String

          # @!attribute limit
          #   Maximum results per page. Default 20, maximum 100.
          #
          #   @return [Integer, nil]
          optional :limit, Integer

          # @!attribute page
          #   Opaque pagination cursor.
          #
          #   @return [String, nil]
          optional :page, String

          # @!attribute betas
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(agent_id:, limit: nil, page: nil, betas: nil, request_options: {})
          #   @param agent_id [String]
          #
          #   @param limit [Integer] Maximum results per page. Default 20, maximum 100.
          #
          #   @param page [String] Opaque pagination cursor.
          #
          #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
