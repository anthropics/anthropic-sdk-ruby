# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        # @see Anthropic::Resources::Beta::Sessions::Events#list
        class EventListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute session_id
          #
          #   @return [String]
          required :session_id, String

          # @!attribute created_at_gt
          #   Return events created after this time (exclusive).
          #
          #   @return [Time, nil]
          optional :created_at_gt, Time

          # @!attribute created_at_gte
          #   Return events created at or after this time (inclusive).
          #
          #   @return [Time, nil]
          optional :created_at_gte, Time

          # @!attribute created_at_lt
          #   Return events created before this time (exclusive).
          #
          #   @return [Time, nil]
          optional :created_at_lt, Time

          # @!attribute created_at_lte
          #   Return events created at or before this time (inclusive).
          #
          #   @return [Time, nil]
          optional :created_at_lte, Time

          # @!attribute limit
          #   Query parameter for limit
          #
          #   @return [Integer, nil]
          optional :limit, Integer

          # @!attribute order
          #   Sort direction for results, ordered by created_at. Defaults to asc
          #   (chronological).
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::EventListParams::Order, nil]
          optional :order, enum: -> { Anthropic::Beta::Sessions::EventListParams::Order }

          # @!attribute page
          #   Opaque pagination cursor from a previous response's next_page.
          #
          #   @return [String, nil]
          optional :page, String

          # @!attribute types
          #   Filter by event type. Values match the `type` field on returned events (for
          #   example, `user.message` or `agent.tool_use`). Omit to return all event types.
          #
          #   @return [Array<String>, nil]
          optional :types, Anthropic::Internal::Type::ArrayOf[String]

          # @!attribute betas
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(session_id:, created_at_gt: nil, created_at_gte: nil, created_at_lt: nil, created_at_lte: nil, limit: nil, order: nil, page: nil, types: nil, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::EventListParams} for more details.
          #
          #   @param session_id [String]
          #
          #   @param created_at_gt [Time] Return events created after this time (exclusive).
          #
          #   @param created_at_gte [Time] Return events created at or after this time (inclusive).
          #
          #   @param created_at_lt [Time] Return events created before this time (exclusive).
          #
          #   @param created_at_lte [Time] Return events created at or before this time (inclusive).
          #
          #   @param limit [Integer] Query parameter for limit
          #
          #   @param order [Symbol, Anthropic::Models::Beta::Sessions::EventListParams::Order] Sort direction for results, ordered by created_at. Defaults to asc (chronologica
          #
          #   @param page [String] Opaque pagination cursor from a previous response's next_page.
          #
          #   @param types [Array<String>] Filter by event type. Values match the `type` field on returned events (for exam
          #
          #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

          # Sort direction for results, ordered by created_at. Defaults to asc
          # (chronological).
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
