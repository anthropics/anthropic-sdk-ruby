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
          #   Return events created after this time (exclusive). Compared against the event's
          #   `processed_at` value.
          #
          #   @return [Time, nil]
          optional :created_at_gt, Time

          # @!attribute created_at_gte
          #   Return events created at or after this time (inclusive). Compared against the
          #   event's `processed_at` value.
          #
          #   @return [Time, nil]
          optional :created_at_gte, Time

          # @!attribute created_at_lt
          #   Return events created before this time (exclusive). Compared against the event's
          #   `processed_at` value.
          #
          #   @return [Time, nil]
          optional :created_at_lt, Time

          # @!attribute created_at_lte
          #   Return events created at or before this time (inclusive). Compared against the
          #   event's `processed_at` value.
          #
          #   @return [Time, nil]
          optional :created_at_lte, Time

          # @!attribute limit
          #
          #   @return [Integer, nil]
          optional :limit, Integer

          # @!attribute order
          #   Sort direction for results, ordered by the event's `processed_at`. Defaults to
          #   `asc` (chronological).
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::EventListParams::Order, nil]
          optional :order, enum: -> { Anthropic::Beta::Sessions::EventListParams::Order }

          # @!attribute page
          #   Opaque pagination cursor from a previous response's `next_page`.
          #
          #   @return [String, nil]
          optional :page, String

          # @!attribute types
          #   Filter by event type. Values match the `type` field on returned events (for
          #   example, `user.message` or `agent.tool_use`). Omit to return all event types.
          #
          #   @return [Array<Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionEventType>, nil]
          optional :types,
                   -> { Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType] }

          # @!attribute betas
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!attribute workspace_id
          #   Optional header to select the Workspace for this request. The value is a
          #   Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          #   Only needed for credentials that can act on more than one Workspace. A
          #   credential that belongs to a specific Workspace may omit it; if sent, it must
          #   match that Workspace.
          #
          #   @return [String, nil]
          optional :workspace_id, String

          # @!method initialize(session_id:, created_at_gt: nil, created_at_gte: nil, created_at_lt: nil, created_at_lte: nil, limit: nil, order: nil, page: nil, types: nil, betas: nil, workspace_id: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::EventListParams} for more details.
          #
          #   @param session_id [String]
          #
          #   @param created_at_gt [Time] Return events created after this time (exclusive). Compared against the event's
          #
          #   @param created_at_gte [Time] Return events created at or after this time (inclusive). Compared against the ev
          #
          #   @param created_at_lt [Time] Return events created before this time (exclusive). Compared against the event's
          #
          #   @param created_at_lte [Time] Return events created at or before this time (inclusive). Compared against the e
          #
          #   @param limit [Integer]
          #
          #   @param order [Symbol, Anthropic::Models::Beta::Sessions::EventListParams::Order] Sort direction for results, ordered by the event's `processed_at`. Defaults to `
          #
          #   @param page [String] Opaque pagination cursor from a previous response's `next_page`.
          #
          #   @param types [Array<Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionEventType>] Filter by event type. Values match the `type` field on returned events (for exam
          #
          #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          #   @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

          # Sort direction for results, ordered by the event's `processed_at`. Defaults to
          # `asc` (chronological).
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
