# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Agents#list
      class AgentListParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute created_at_gte
        #   Return agents created at or after this time (inclusive).
        #
        #   @return [Time, nil]
        optional :created_at_gte, Time

        # @!attribute created_at_lte
        #   Return agents created at or before this time (inclusive).
        #
        #   @return [Time, nil]
        optional :created_at_lte, Time

        # @!attribute include_archived
        #   Include archived agents in results. Defaults to false.
        #
        #   @return [Boolean, nil]
        optional :include_archived, Anthropic::Internal::Type::Boolean

        # @!attribute limit
        #   Maximum results per page. Default 20, maximum 100.
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!attribute page
        #   Opaque pagination cursor from a previous response.
        #
        #   @return [String, nil]
        optional :page, String

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(created_at_gte: nil, created_at_lte: nil, include_archived: nil, limit: nil, page: nil, betas: nil, request_options: {})
        #   @param created_at_gte [Time] Return agents created at or after this time (inclusive).
        #
        #   @param created_at_lte [Time] Return agents created at or before this time (inclusive).
        #
        #   @param include_archived [Boolean] Include archived agents in results. Defaults to false.
        #
        #   @param limit [Integer] Maximum results per page. Default 20, maximum 100.
        #
        #   @param page [String] Opaque pagination cursor from a previous response.
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
