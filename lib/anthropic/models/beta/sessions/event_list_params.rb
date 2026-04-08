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

          # @!attribute betas
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(session_id:, limit: nil, order: nil, page: nil, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::EventListParams} for more details.
          #
          #   @param session_id [String]
          #
          #   @param limit [Integer] Query parameter for limit
          #
          #   @param order [Symbol, Anthropic::Models::Beta::Sessions::EventListParams::Order] Sort direction for results, ordered by created_at. Defaults to asc (chronologica
          #
          #   @param page [String] Opaque pagination cursor from a previous response's next_page.
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
