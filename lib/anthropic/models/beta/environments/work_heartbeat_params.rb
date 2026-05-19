# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Environments
        # @see Anthropic::Resources::Beta::Environments::Work#heartbeat
        class WorkHeartbeatParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute environment_id
          #
          #   @return [String]
          required :environment_id, String

          # @!attribute work_id
          #
          #   @return [String]
          required :work_id, String

          # @!attribute desired_ttl_seconds
          #   Desired TTL in seconds
          #
          #   @return [Integer, nil]
          optional :desired_ttl_seconds, Integer, nil?: true

          # @!attribute expected_last_heartbeat
          #   Expected last_heartbeat for conditional update (optimistic concurrency). Use
          #   literal 'NO_HEARTBEAT' to claim an unclaimed lease (first heartbeat). For
          #   subsequent heartbeats, echo the server's previous last_heartbeat value exactly.
          #   Returns 412 Precondition Failed if the actual value doesn't match.
          #
          #   @return [String, nil]
          optional :expected_last_heartbeat, String, nil?: true

          # @!attribute betas
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(environment_id:, work_id:, desired_ttl_seconds: nil, expected_last_heartbeat: nil, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Environments::WorkHeartbeatParams} for more details.
          #
          #   @param environment_id [String]
          #
          #   @param work_id [String]
          #
          #   @param desired_ttl_seconds [Integer, nil] Desired TTL in seconds
          #
          #   @param expected_last_heartbeat [String, nil] Expected last_heartbeat for conditional update (optimistic concurrency). Use lit
          #
          #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
