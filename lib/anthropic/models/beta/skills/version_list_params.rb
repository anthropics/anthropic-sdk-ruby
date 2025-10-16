# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Skills
        # @see Anthropic::Resources::Beta::Skills::Versions#list
        class VersionListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute limit
          #   Number of items to return per page.
          #
          #   Defaults to `20`. Ranges from `1` to `1000`.
          #
          #   @return [Integer, nil]
          optional :limit, Integer, nil?: true

          # @!attribute page
          #   Optionally set to the `next_page` token from the previous response.
          #
          #   @return [String, nil]
          optional :page, String, nil?: true

          # @!attribute betas
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(limit: nil, page: nil, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Skills::VersionListParams} for more details.
          #
          #   @param limit [Integer, nil] Number of items to return per page.
          #
          #   @param page [String, nil] Optionally set to the `next_page` token from the previous response.
          #
          #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
