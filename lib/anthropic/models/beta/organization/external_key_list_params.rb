# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::ExternalKeys#list
        class ExternalKeyListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

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

          # @!method initialize(limit: nil, page: nil, request_options: {})
          #   @param limit [Integer] Number of results per page.
          #
          #   @param page [String, nil] Opaque cursor from a previous response's `next_page`.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
