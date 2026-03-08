# frozen_string_literal: true

module Anthropic
  module Models
    module Messages
      # @see Anthropic::Resources::Messages::Batches#results_streaming
      class BatchResultsParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute message_batch_id
        #   ID of the Message Batch.
        #
        #   @return [String]
        required :message_batch_id, String

        # @!method initialize(message_batch_id:, request_options: {})
        #   @param message_batch_id [String] ID of the Message Batch.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
