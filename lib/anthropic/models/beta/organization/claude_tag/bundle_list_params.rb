# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          # @see Anthropic::Resources::Beta::Organization::ClaudeTag::Bundles#list
          class BundleListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute limit
            #   Number of items to return per page, between 1 and 100. Defaults to 20.
            #
            #   @return [Integer, nil]
            optional :limit, Integer

            # @!attribute page
            #   Opaque cursor from a previous response's `next_page`.
            #
            #   @return [String, nil]
            optional :page, String

            # @!attribute betas
            #   This endpoint is in beta: requests must send
            #   `experimental-claude-tag-2026-10-21` in this header.
            #
            #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
            optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

            # @!method initialize(limit: nil, page: nil, betas: nil, request_options: {})
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::ClaudeTag::BundleListParams} for more
            #   details.
            #
            #   @param limit [Integer] Number of items to return per page, between 1 and 100. Defaults to 20.
            #
            #   @param page [String] Opaque cursor from a previous response's `next_page`.
            #
            #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `experimental-claude-tag-2026-10-21
            #
            #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
          end
        end
      end
    end
  end
end
