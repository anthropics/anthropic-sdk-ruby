# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # @see Anthropic::Resources::Beta::MemoryStores::MemoryVersions#list
        class MemoryVersionListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute memory_store_id
          #
          #   @return [String]
          required :memory_store_id, String

          # @!attribute api_key_id
          #   Query parameter for api_key_id
          #
          #   @return [String, nil]
          optional :api_key_id, String

          # @!attribute created_at_gte
          #   Return versions created at or after this time (inclusive).
          #
          #   @return [Time, nil]
          optional :created_at_gte, Time

          # @!attribute created_at_lte
          #   Return versions created at or before this time (inclusive).
          #
          #   @return [Time, nil]
          optional :created_at_lte, Time

          # @!attribute limit
          #   Query parameter for limit
          #
          #   @return [Integer, nil]
          optional :limit, Integer

          # @!attribute memory_id
          #   Query parameter for memory_id
          #
          #   @return [String, nil]
          optional :memory_id, String

          # @!attribute operation
          #   Query parameter for operation
          #
          #   @return [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation, nil]
          optional :operation, enum: -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation }

          # @!attribute page
          #   Query parameter for page
          #
          #   @return [String, nil]
          optional :page, String

          # @!attribute session_id
          #   Query parameter for session_id
          #
          #   @return [String, nil]
          optional :session_id, String

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

          # @!method initialize(memory_store_id:, api_key_id: nil, created_at_gte: nil, created_at_lte: nil, limit: nil, memory_id: nil, operation: nil, page: nil, session_id: nil, view: nil, betas: nil, request_options: {})
          #   @param memory_store_id [String]
          #
          #   @param api_key_id [String] Query parameter for api_key_id
          #
          #   @param created_at_gte [Time] Return versions created at or after this time (inclusive).
          #
          #   @param created_at_lte [Time] Return versions created at or before this time (inclusive).
          #
          #   @param limit [Integer] Query parameter for limit
          #
          #   @param memory_id [String] Query parameter for memory_id
          #
          #   @param operation [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation] Query parameter for operation
          #
          #   @param page [String] Query parameter for page
          #
          #   @param session_id [String] Query parameter for session_id
          #
          #   @param view [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryView] Query parameter for view
          #
          #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
