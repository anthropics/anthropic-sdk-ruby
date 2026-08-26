# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Federation
          # @see Anthropic::Resources::Beta::Organization::Federation::Rules#list
          class RuleListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute include_archived
            #   Include archived resources. Defaults to false.
            #
            #   @return [Boolean, nil]
            optional :include_archived, Anthropic::Internal::Type::Boolean

            # @!attribute issuer_id
            #   Filter to rules referencing this federation issuer.
            #
            #   @return [String, nil]
            optional :issuer_id, String, nil?: true

            # @!attribute limit
            #   Number of results per page.
            #
            #   @return [Integer, nil]
            optional :limit, Integer

            # @!attribute page
            #   Opaque cursor from a previous response's `next_page`.
            #
            #   @return [String, nil]
            optional :page, String, nil?: true

            # @!attribute betas
            #   Optional header to specify the beta version(s) you want to use.
            #
            #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
            optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

            # @!method initialize(include_archived: nil, issuer_id: nil, limit: nil, page: nil, betas: nil, request_options: {})
            #   @param include_archived [Boolean] Include archived resources. Defaults to false.
            #
            #   @param issuer_id [String, nil] Filter to rules referencing this federation issuer.
            #
            #   @param limit [Integer] Number of results per page.
            #
            #   @param page [String, nil] Opaque cursor from a previous response's `next_page`.
            #
            #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
            #
            #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
          end
        end
      end
    end
  end
end
