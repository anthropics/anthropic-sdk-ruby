# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Sessions#list
      class SessionListParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute agent_id
        #   Filter sessions created with this agent ID.
        #
        #   @return [String, nil]
        optional :agent_id, String

        # @!attribute agent_version
        #   Filter by agent version. Only applies when agent_id is also set.
        #
        #   @return [Integer, nil]
        optional :agent_version, Integer

        # @!attribute created_at_gt
        #   Return sessions created after this time (exclusive).
        #
        #   @return [Time, nil]
        optional :created_at_gt, Time

        # @!attribute created_at_gte
        #   Return sessions created at or after this time (inclusive).
        #
        #   @return [Time, nil]
        optional :created_at_gte, Time

        # @!attribute created_at_lt
        #   Return sessions created before this time (exclusive).
        #
        #   @return [Time, nil]
        optional :created_at_lt, Time

        # @!attribute created_at_lte
        #   Return sessions created at or before this time (inclusive).
        #
        #   @return [Time, nil]
        optional :created_at_lte, Time

        # @!attribute include_archived
        #   When true, includes archived sessions. Default: false (exclude archived).
        #
        #   @return [Boolean, nil]
        optional :include_archived, Anthropic::Internal::Type::Boolean

        # @!attribute limit
        #   Maximum number of results to return.
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!attribute memory_store_id
        #   Filter sessions whose resources contain a memory_store with this memory store
        #   ID.
        #
        #   @return [String, nil]
        optional :memory_store_id, String

        # @!attribute order
        #   Sort direction for results, ordered by created_at. Defaults to desc (newest
        #   first).
        #
        #   @return [Symbol, Anthropic::Models::Beta::SessionListParams::Order, nil]
        optional :order, enum: -> { Anthropic::Beta::SessionListParams::Order }

        # @!attribute page
        #   Opaque pagination cursor from a previous response's next_page.
        #
        #   @return [String, nil]
        optional :page, String

        # @!attribute statuses
        #   Filter by session status. Repeat the parameter to match any of multiple
        #   statuses.
        #
        #   @return [Array<Symbol, Anthropic::Models::Beta::SessionListParams::Status>, nil]
        optional :statuses,
                 -> { Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::SessionListParams::Status] }

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(agent_id: nil, agent_version: nil, created_at_gt: nil, created_at_gte: nil, created_at_lt: nil, created_at_lte: nil, include_archived: nil, limit: nil, memory_store_id: nil, order: nil, page: nil, statuses: nil, betas: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::SessionListParams} for more details.
        #
        #   @param agent_id [String] Filter sessions created with this agent ID.
        #
        #   @param agent_version [Integer] Filter by agent version. Only applies when agent_id is also set.
        #
        #   @param created_at_gt [Time] Return sessions created after this time (exclusive).
        #
        #   @param created_at_gte [Time] Return sessions created at or after this time (inclusive).
        #
        #   @param created_at_lt [Time] Return sessions created before this time (exclusive).
        #
        #   @param created_at_lte [Time] Return sessions created at or before this time (inclusive).
        #
        #   @param include_archived [Boolean] When true, includes archived sessions. Default: false (exclude archived).
        #
        #   @param limit [Integer] Maximum number of results to return.
        #
        #   @param memory_store_id [String] Filter sessions whose resources contain a memory_store with this memory store ID
        #
        #   @param order [Symbol, Anthropic::Models::Beta::SessionListParams::Order] Sort direction for results, ordered by created_at. Defaults to desc (newest firs
        #
        #   @param page [String] Opaque pagination cursor from a previous response's next_page.
        #
        #   @param statuses [Array<Symbol, Anthropic::Models::Beta::SessionListParams::Status>] Filter by session status. Repeat the parameter to match any of multiple statuses
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

        # Sort direction for results, ordered by created_at. Defaults to desc (newest
        # first).
        module Order
          extend Anthropic::Internal::Type::Enum

          ASC = :asc
          DESC = :desc

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # SessionStatus enum
        module Status
          extend Anthropic::Internal::Type::Enum

          RESCHEDULING = :rescheduling
          RUNNING = :running
          IDLE = :idle
          TERMINATED = :terminated

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
