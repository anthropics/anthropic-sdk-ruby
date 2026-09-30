# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # @see Anthropic::Resources::Organization::ServiceAccounts#list
      class ServiceAccountListParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute include_archived
        #   Include archived resources. Defaults to false.
        #
        #   @return [Boolean, nil]
        optional :include_archived, Anthropic::Internal::Type::Boolean

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

        # @!method initialize(include_archived: nil, limit: nil, page: nil, request_options: {})
        #   @param include_archived [Boolean] Include archived resources. Defaults to false.
        #
        #   @param limit [Integer] Number of results per page.
        #
        #   @param page [String, nil] Opaque cursor from a previous response's `next_page`.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
