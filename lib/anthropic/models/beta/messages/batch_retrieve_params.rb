# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        # @see Anthropic::Resources::Beta::Messages::Batches#retrieve
        class BatchRetrieveParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute message_batch_id
          #   ID of the Message Batch.
          #
          #   @return [String]
          required :message_batch_id, String

          # @!attribute betas
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!attribute workspace_id
          #
          #   @return [String, nil]
          optional :workspace_id, String

          # @!method initialize(message_batch_id:, betas: nil, workspace_id: nil, request_options: {})
          #   @param message_batch_id [String] ID of the Message Batch.
          #
          #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          #   @param workspace_id [String]
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
