# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Environments
        # @see Anthropic::Resources::Beta::Environments::Work#poll
        class WorkPollParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute environment_id
          #
          #   @return [String]
          required :environment_id, String

          # @!attribute block_ms
          #   How long to wait for work to arrive before returning. Must be 1-999 in
          #   milliseconds. Defaults to non-blocking (returns immediately if no work is
          #   available).
          #
          #   @return [Integer, nil]
          optional :block_ms, Integer, nil?: true

          # @!attribute reclaim_older_than_ms
          #   Reclaim unacknowledged work items older than this many milliseconds. If omitted,
          #   uses the default (5000ms).
          #
          #   @return [Integer, nil]
          optional :reclaim_older_than_ms, Integer, nil?: true

          # @!attribute betas
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!attribute anthropic_worker_id
          #   Unique identifier for the specific worker polling, used to track aggregated
          #   environment-level work metrics in Console
          #
          #   @return [String, nil]
          optional :anthropic_worker_id, String

          # @!method initialize(environment_id:, block_ms: nil, reclaim_older_than_ms: nil, betas: nil, anthropic_worker_id: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Environments::WorkPollParams} for more details.
          #
          #   @param environment_id [String]
          #
          #   @param block_ms [Integer, nil] How long to wait for work to arrive before returning. Must be 1-999 in milliseco
          #
          #   @param reclaim_older_than_ms [Integer, nil] Reclaim unacknowledged work items older than this many milliseconds. If omitted,
          #
          #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          #   @param anthropic_worker_id [String] Unique identifier for the specific worker polling, used to track aggregated envi
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
