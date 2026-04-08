# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Vaults#list
      class VaultListParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute include_archived
        #   Whether to include archived vaults in the results.
        #
        #   @return [Boolean, nil]
        optional :include_archived, Anthropic::Internal::Type::Boolean

        # @!attribute limit
        #   Maximum number of vaults to return per page. Defaults to 20, maximum 100.
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!attribute page
        #   Opaque pagination token from a previous `list_vaults` response.
        #
        #   @return [String, nil]
        optional :page, String

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(include_archived: nil, limit: nil, page: nil, betas: nil, request_options: {})
        #   @param include_archived [Boolean] Whether to include archived vaults in the results.
        #
        #   @param limit [Integer] Maximum number of vaults to return per page. Defaults to 20, maximum 100.
        #
        #   @param page [String] Opaque pagination token from a previous `list_vaults` response.
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
