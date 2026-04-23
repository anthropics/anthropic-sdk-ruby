# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # @see Anthropic::Resources::Beta::MemoryStores::Memories#list
        class MemoryListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute memory_store_id
          #
          #   @return [String]
          required :memory_store_id, String

          # @!attribute depth
          #   Query parameter for depth
          #
          #   @return [Integer, nil]
          optional :depth, Integer

          # @!attribute limit
          #   Query parameter for limit
          #
          #   @return [Integer, nil]
          optional :limit, Integer

          # @!attribute order
          #   Query parameter for order
          #
          #   @return [Symbol, Anthropic::Models::Beta::MemoryStores::MemoryListParams::Order, nil]
          optional :order, enum: -> { Anthropic::Beta::MemoryStores::MemoryListParams::Order }

          # @!attribute order_by
          #   Query parameter for order_by
          #
          #   @return [String, nil]
          optional :order_by, String

          # @!attribute page
          #   Query parameter for page
          #
          #   @return [String, nil]
          optional :page, String

          # @!attribute path_prefix
          #   Optional path prefix filter (raw string-prefix match; include a trailing slash
          #   for directory-scoped lists). This value appears in request URLs. Do not include
          #   secrets or personally identifiable information.
          #
          #   @return [String, nil]
          optional :path_prefix, String

          # @!attribute view
          #   Query parameter for view
          #
          #   @return [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryView, nil]
          optional :view, enum: -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView }

          # @!attribute betas
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(memory_store_id:, depth: nil, limit: nil, order: nil, order_by: nil, page: nil, path_prefix: nil, view: nil, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::MemoryStores::MemoryListParams} for more details.
          #
          #   @param memory_store_id [String]
          #
          #   @param depth [Integer] Query parameter for depth
          #
          #   @param limit [Integer] Query parameter for limit
          #
          #   @param order [Symbol, Anthropic::Models::Beta::MemoryStores::MemoryListParams::Order] Query parameter for order
          #
          #   @param order_by [String] Query parameter for order_by
          #
          #   @param page [String] Query parameter for page
          #
          #   @param path_prefix [String] Optional path prefix filter (raw string-prefix match; include a trailing slash f
          #
          #   @param view [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryView] Query parameter for view
          #
          #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

          # Query parameter for order
          module Order
            extend Anthropic::Internal::Type::Enum

            ASC = :asc
            DESC = :desc

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
