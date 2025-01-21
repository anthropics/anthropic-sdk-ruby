# frozen_string_literal: true

module Anthropic
  module Resources
    class Messages
      class Batches
        # Send a batch of Message creation requests.
        #
        #   The Message Batches API can be used to process multiple Messages API requests at
        #   once. Once a Message Batch is created, it begins processing immediately. Batches
        #   can take up to 24 hours to complete.
        #
        # @param params [Anthropic::Models::Messages::BatchCreateParams, Hash{Symbol=>Object}] Attributes to send in this request.
        #
        #   @option params [Array<Anthropic::Models::Messages::BatchCreateParams::Request>] :requests List of requests for prompt completion. Each is an individual request to create
        #     a Message.
        #
        # @param opts [Hash{Symbol=>Object}, Anthropic::RequestOptions] Options to specify HTTP behaviour for this request.
        #
        # @return [Anthropic::Models::Messages::MessageBatch]
        #
        def create(params = {}, opts = {})
          parsed = Anthropic::Models::Messages::BatchCreateParams.dump(params)
          req = {
            method: :post,
            path: "v1/messages/batches",
            body: parsed,
            model: Anthropic::Models::Messages::MessageBatch
          }
          @client.request(req, opts)
        end

        # This endpoint is idempotent and can be used to poll for Message Batch
        #   completion. To access the results of a Message Batch, make a request to the
        #   `results_url` field in the response.
        #
        # @param message_batch_id [String] ID of the Message Batch.
        #
        # @param opts [Hash{Symbol=>Object}, Anthropic::RequestOptions] Options to specify HTTP behaviour for this request.
        #
        # @return [Anthropic::Models::Messages::MessageBatch]
        #
        def retrieve(message_batch_id, opts = {})
          req = {
            method: :get,
            path: ["v1/messages/batches/%0s", message_batch_id],
            model: Anthropic::Models::Messages::MessageBatch
          }
          @client.request(req, opts)
        end

        # List all Message Batches within a Workspace. Most recently created batches are
        #   returned first.
        #
        # @param params [Anthropic::Models::Messages::BatchListParams, Hash{Symbol=>Object}] Attributes to send in this request.
        #
        #   @option params [String] :after_id ID of the object to use as a cursor for pagination. When provided, returns the
        #     page of results immediately after this object.
        #
        #   @option params [String] :before_id ID of the object to use as a cursor for pagination. When provided, returns the
        #     page of results immediately before this object.
        #
        #   @option params [Integer] :limit Number of items to return per page.
        #
        #     Defaults to `20`. Ranges from `1` to `1000`.
        #
        # @param opts [Hash{Symbol=>Object}, Anthropic::RequestOptions] Options to specify HTTP behaviour for this request.
        #
        # @return [Anthropic::Page<Anthropic::Models::Messages::MessageBatch>]
        #
        def list(params = {}, opts = {})
          parsed = Anthropic::Models::Messages::BatchListParams.dump(params)
          req = {
            method: :get,
            path: "v1/messages/batches",
            query: parsed,
            page: Anthropic::Page,
            model: Anthropic::Models::Messages::MessageBatch
          }
          @client.request(req, opts)
        end

        # This endpoint is idempotent and can be used to poll for Message Batch
        #   completion. To access the results of a Message Batch, make a request to the
        #   `results_url` field in the response.
        #
        # @param message_batch_id [String] ID of the Message Batch.
        #
        # @param opts [Hash{Symbol=>Object}, Anthropic::RequestOptions] Options to specify HTTP behaviour for this request.
        #
        # @return [Anthropic::Models::Messages::DeletedMessageBatch]
        #
        def delete(message_batch_id, opts = {})
          req = {
            method: :delete,
            path: ["v1/messages/batches/%0s", message_batch_id],
            model: Anthropic::Models::Messages::DeletedMessageBatch
          }
          @client.request(req, opts)
        end

        # Batches may be canceled any time before processing ends. Once cancellation is
        #   initiated, the batch enters a `canceling` state, at which time the system may
        #   complete any in-progress, non-interruptible requests before finalizing
        #   cancellation.
        #
        #   The number of canceled requests is specified in `request_counts`. To determine
        #   which requests were canceled, check the individual results within the batch.
        #   Note that cancellation may not result in any canceled requests if they were
        #   non-interruptible.
        #
        # @param message_batch_id [String] ID of the Message Batch.
        #
        # @param opts [Hash{Symbol=>Object}, Anthropic::RequestOptions] Options to specify HTTP behaviour for this request.
        #
        # @return [Anthropic::Models::Messages::MessageBatch]
        #
        def cancel(message_batch_id, opts = {})
          req = {
            method: :post,
            path: ["v1/messages/batches/%0s/cancel", message_batch_id],
            model: Anthropic::Models::Messages::MessageBatch
          }
          @client.request(req, opts)
        end

        # Streams the results of a Message Batch as a `.jsonl` file.
        #
        #   Each line in the file is a JSON object containing the result of a single request
        #   in the Message Batch. Results are not guaranteed to be in the same order as
        #   requests. Use the `custom_id` field to match results to requests.
        #
        # @param message_batch_id [String] ID of the Message Batch.
        #
        # @param opts [Hash{Symbol=>Object}, Anthropic::RequestOptions] Options to specify HTTP behaviour for this request.
        #
        # @return [Anthropic::Models::Messages::MessageBatchIndividualResponse]
        #
        def results(message_batch_id, opts = {})
          req = {
            method: :get,
            path: ["v1/messages/batches/%0s/results", message_batch_id],
            headers: {"Accept" => "application/x-jsonl"},
            model: Anthropic::Models::Messages::MessageBatchIndividualResponse
          }
          @client.request(req, opts)
        end

        # @param client [Anthropic::Client]
        #
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
