# frozen_string_literal: true

module Anthropic
  module Resources
    class Messages
      class Batches
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Messages::BatchCreateParams} for more details.
        #
        # Send a batch of Message creation requests.
        #
        # The Message Batches API can be used to process multiple Messages API requests at
        # once. Once a Message Batch is created, it begins processing immediately. Batches
        # can take up to 24 hours to complete.
        #
        # Learn more about the Message Batches API in our
        # [user guide](/en/docs/build-with-claude/batch-processing)
        #
        # @overload create(requests:, request_options: {})
        #
        # @param requests [Array<Anthropic::Models::Messages::BatchCreateParams::Request>] List of requests for prompt completion. Each is an individual request to create
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Messages::MessageBatch]
        #
        # @see Anthropic::Models::Messages::BatchCreateParams
        def create(params)
          parsed, options = Anthropic::Messages::BatchCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "v1/messages/batches",
            body: parsed,
            model: Anthropic::Messages::MessageBatch,
            options: options
          )
        end

        # This endpoint is idempotent and can be used to poll for Message Batch
        # completion. To access the results of a Message Batch, make a request to the
        # `results_url` field in the response.
        #
        # Learn more about the Message Batches API in our
        # [user guide](/en/docs/build-with-claude/batch-processing)
        #
        # @overload retrieve(message_batch_id, request_options: {})
        #
        # @param message_batch_id [String] ID of the Message Batch.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Messages::MessageBatch]
        #
        # @see Anthropic::Models::Messages::BatchRetrieveParams
        def retrieve(message_batch_id, params = {})
          @client.request(
            method: :get,
            path: ["v1/messages/batches/%1$s", message_batch_id],
            model: Anthropic::Messages::MessageBatch,
            options: params[:request_options]
          )
        end

        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Messages::BatchListParams} for more details.
        #
        # List all Message Batches within a Workspace. Most recently created batches are
        # returned first.
        #
        # Learn more about the Message Batches API in our
        # [user guide](/en/docs/build-with-claude/batch-processing)
        #
        # @overload list(after_id: nil, before_id: nil, limit: nil, request_options: {})
        #
        # @param after_id [String] ID of the object to use as a cursor for pagination. When provided, returns the p
        #
        # @param before_id [String] ID of the object to use as a cursor for pagination. When provided, returns the p
        #
        # @param limit [Integer] Number of items to return per page.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Internal::Page<Anthropic::Models::Messages::MessageBatch>]
        #
        # @see Anthropic::Models::Messages::BatchListParams
        def list(params = {})
          parsed, options = Anthropic::Messages::BatchListParams.dump_request(params)
          @client.request(
            method: :get,
            path: "v1/messages/batches",
            query: parsed,
            page: Anthropic::Internal::Page,
            model: Anthropic::Messages::MessageBatch,
            options: options
          )
        end

        # Delete a Message Batch.
        #
        # Message Batches can only be deleted once they've finished processing. If you'd
        # like to delete an in-progress batch, you must first cancel it.
        #
        # Learn more about the Message Batches API in our
        # [user guide](/en/docs/build-with-claude/batch-processing)
        #
        # @overload delete(message_batch_id, request_options: {})
        #
        # @param message_batch_id [String] ID of the Message Batch.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Messages::DeletedMessageBatch]
        #
        # @see Anthropic::Models::Messages::BatchDeleteParams
        def delete(message_batch_id, params = {})
          @client.request(
            method: :delete,
            path: ["v1/messages/batches/%1$s", message_batch_id],
            model: Anthropic::Messages::DeletedMessageBatch,
            options: params[:request_options]
          )
        end

        # Batches may be canceled any time before processing ends. Once cancellation is
        # initiated, the batch enters a `canceling` state, at which time the system may
        # complete any in-progress, non-interruptible requests before finalizing
        # cancellation.
        #
        # The number of canceled requests is specified in `request_counts`. To determine
        # which requests were canceled, check the individual results within the batch.
        # Note that cancellation may not result in any canceled requests if they were
        # non-interruptible.
        #
        # Learn more about the Message Batches API in our
        # [user guide](/en/docs/build-with-claude/batch-processing)
        #
        # @overload cancel(message_batch_id, request_options: {})
        #
        # @param message_batch_id [String] ID of the Message Batch.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Messages::MessageBatch]
        #
        # @see Anthropic::Models::Messages::BatchCancelParams
        def cancel(message_batch_id, params = {})
          @client.request(
            method: :post,
            path: ["v1/messages/batches/%1$s/cancel", message_batch_id],
            model: Anthropic::Messages::MessageBatch,
            options: params[:request_options]
          )
        end

        # Streams the results of a Message Batch as a `.jsonl` file.
        #
        # Each line in the file is a JSON object containing the result of a single request
        # in the Message Batch. Results are not guaranteed to be in the same order as
        # requests. Use the `custom_id` field to match results to requests.
        #
        # Learn more about the Message Batches API in our
        # [user guide](/en/docs/build-with-claude/batch-processing)
        #
        # @overload results_streaming(message_batch_id, request_options: {})
        #
        # @param message_batch_id [String] ID of the Message Batch.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Internal::JsonLStream<Anthropic::Models::Messages::MessageBatchIndividualResponse>]
        #
        # @see Anthropic::Models::Messages::BatchResultsParams
        def results_streaming(message_batch_id, params = {})
          @client.request(
            method: :get,
            path: ["v1/messages/batches/%1$s/results", message_batch_id],
            headers: {"accept" => "application/x-jsonl"},
            stream: Anthropic::Internal::JsonLStream,
            model: Anthropic::Messages::MessageBatchIndividualResponse,
            options: params[:request_options]
          )
        end

        # @api private
        #
        # @param client [Anthropic::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
