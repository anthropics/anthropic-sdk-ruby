# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::ExternalStorage#list
        class ExternalStorageListParams < Anthropic::Internal::Type::BaseModel
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

          # @!attribute user_profile_ids
          #   Returns only External Storage bound to one of these user profile IDs
          #   (`uprof_...`). An empty entry matches storage bound to no user profile. At most
          #   10 entries, counting repeats.
          #
          #   @return [Array<String>, nil]
          optional :user_profile_ids, Anthropic::Internal::Type::ArrayOf[String], nil?: true

          # @!attribute betas
          #   This endpoint is in beta: requests must send `efs-2026-10-01` in this header.
          #
          #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(limit: nil, page: nil, user_profile_ids: nil, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::ExternalStorageListParams} for more
          #   details.
          #
          #   @param limit [Integer] Number of results per page.
          #
          #   @param page [String, nil] Opaque cursor from a previous response's `next_page`.
          #
          #   @param user_profile_ids [Array<String>, nil] Returns only External Storage bound to one of these user profile IDs (
          #
          #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `efs-2026-10-01` in this header.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
