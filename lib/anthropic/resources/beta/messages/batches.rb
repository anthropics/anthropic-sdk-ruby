# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Messages
        class Batches
          # Send a batch of Message creation requests.
          #
          #   The Message Batches API can be used to process multiple Messages API requests at
          #   once. Once a Message Batch is created, it begins processing immediately. Batches
          #   can take up to 24 hours to complete.
          #
          #   Learn more about the Message Batches API in our
          #   [user guide](/en/docs/build-with-claude/batch-processing)
          #
          # @param params [Anthropic::Models::Beta::Messages::BatchCreateParams, Hash{Symbol=>Object}] .
          #
          #   @option params [Array<Anthropic::Models::Beta::Messages::BatchCreateParams::Request>] :requests Body param: List of requests for prompt completion. Each is an individual
          #     request to create a Message.
          #
          #   @option params [Array<String, Symbol, Anthropic::Models::AnthropicBeta::UnionMember1>] :betas Header param: Optional header to specify the beta version(s) you want to use.
          #
          #   @option params [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
          #
          # @return [Anthropic::Models::Beta::Messages::BetaMessageBatch]
          #
          def create(params)
            parsed, options = Anthropic::Models::Beta::Messages::BatchCreateParams.dump_request(params)
            header_params = [:"anthropic-beta"]
            @client.request(
              method: :post,
              path: "v1/messages/batches?beta=true",
              headers: parsed.slice(*header_params),
              body: parsed.except(*header_params),
              model: Anthropic::Models::Beta::Messages::BetaMessageBatch,
              options: options
            )
          end

          # This endpoint is idempotent and can be used to poll for Message Batch
          #   completion. To access the results of a Message Batch, make a request to the
          #   `results_url` field in the response.
          #
          #   Learn more about the Message Batches API in our
          #   [user guide](/en/docs/build-with-claude/batch-processing)
          #
          # @param message_batch_id [String] ID of the Message Batch.
          #
          # @param params [Anthropic::Models::Beta::Messages::BatchRetrieveParams, Hash{Symbol=>Object}] .
          #
          #   @option params [Array<String, Symbol, Anthropic::Models::AnthropicBeta::UnionMember1>] :betas Optional header to specify the beta version(s) you want to use.
          #
          #   @option params [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
          #
          # @return [Anthropic::Models::Beta::Messages::BetaMessageBatch]
          #
          def retrieve(message_batch_id, params = {})
            parsed, options = Anthropic::Models::Beta::Messages::BatchRetrieveParams.dump_request(params)
            @client.request(
              method: :get,
              path: ["v1/messages/batches/%0s?beta=true", message_batch_id],
              headers: parsed,
              model: Anthropic::Models::Beta::Messages::BetaMessageBatch,
              options: options
            )
          end

          # List all Message Batches within a Workspace. Most recently created batches are
          #   returned first.
          #
          #   Learn more about the Message Batches API in our
          #   [user guide](/en/docs/build-with-claude/batch-processing)
          #
          # @param params [Anthropic::Models::Beta::Messages::BatchListParams, Hash{Symbol=>Object}] .
          #
          #   @option params [String] :after_id Query param: ID of the object to use as a cursor for pagination. When provided,
          #     returns the page of results immediately after this object.
          #
          #   @option params [String] :before_id Query param: ID of the object to use as a cursor for pagination. When provided,
          #     returns the page of results immediately before this object.
          #
          #   @option params [Integer] :limit Query param: Number of items to return per page.
          #
          #     Defaults to `20`. Ranges from `1` to `1000`.
          #
          #   @option params [Array<String, Symbol, Anthropic::Models::AnthropicBeta::UnionMember1>] :betas Header param: Optional header to specify the beta version(s) you want to use.
          #
          #   @option params [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
          #
          # @return [Anthropic::Page<Anthropic::Models::Beta::Messages::BetaMessageBatch>]
          #
          def list(params = {})
            parsed, options = Anthropic::Models::Beta::Messages::BatchListParams.dump_request(params)
            query_params = [:after_id, :before_id, :limit]
            @client.request(
              method: :get,
              path: "v1/messages/batches?beta=true",
              query: parsed.slice(*query_params),
              headers: parsed.except(*query_params),
              page: Anthropic::Page,
              model: Anthropic::Models::Beta::Messages::BetaMessageBatch,
              options: options
            )
          end

          # Delete a Message Batch.
          #
          #   Message Batches can only be deleted once they've finished processing. If you'd
          #   like to delete an in-progress batch, you must first cancel it.
          #
          #   Learn more about the Message Batches API in our
          #   [user guide](/en/docs/build-with-claude/batch-processing)
          #
          # @param message_batch_id [String] ID of the Message Batch.
          #
          # @param params [Anthropic::Models::Beta::Messages::BatchDeleteParams, Hash{Symbol=>Object}] .
          #
          #   @option params [Array<String, Symbol, Anthropic::Models::AnthropicBeta::UnionMember1>] :betas Optional header to specify the beta version(s) you want to use.
          #
          #   @option params [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
          #
          # @return [Anthropic::Models::Beta::Messages::BetaDeletedMessageBatch]
          #
          def delete(message_batch_id, params = {})
            parsed, options = Anthropic::Models::Beta::Messages::BatchDeleteParams.dump_request(params)
            @client.request(
              method: :delete,
              path: ["v1/messages/batches/%0s?beta=true", message_batch_id],
              headers: parsed,
              model: Anthropic::Models::Beta::Messages::BetaDeletedMessageBatch,
              options: options
            )
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
          #   Learn more about the Message Batches API in our
          #   [user guide](/en/docs/build-with-claude/batch-processing)
          #
          # @param message_batch_id [String] ID of the Message Batch.
          #
          # @param params [Anthropic::Models::Beta::Messages::BatchCancelParams, Hash{Symbol=>Object}] .
          #
          #   @option params [Array<String, Symbol, Anthropic::Models::AnthropicBeta::UnionMember1>] :betas Optional header to specify the beta version(s) you want to use.
          #
          #   @option params [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
          #
          # @return [Anthropic::Models::Beta::Messages::BetaMessageBatch]
          #
          def cancel(message_batch_id, params = {})
            parsed, options = Anthropic::Models::Beta::Messages::BatchCancelParams.dump_request(params)
            @client.request(
              method: :post,
              path: ["v1/messages/batches/%0s/cancel?beta=true", message_batch_id],
              headers: parsed,
              model: Anthropic::Models::Beta::Messages::BetaMessageBatch,
              options: options
            )
          end

          # Streams the results of a Message Batch as a `.jsonl` file.
          #
          #   Each line in the file is a JSON object containing the result of a single request
          #   in the Message Batch. Results are not guaranteed to be in the same order as
          #   requests. Use the `custom_id` field to match results to requests.
          #
          #   Learn more about the Message Batches API in our
          #   [user guide](/en/docs/build-with-claude/batch-processing)
          #
          # @param message_batch_id [String] ID of the Message Batch.
          #
          # @param params [Anthropic::Models::Beta::Messages::BatchResultsParams, Hash{Symbol=>Object}] .
          #
          #   @option params [Array<String, Symbol, Anthropic::Models::AnthropicBeta::UnionMember1>] :betas Optional header to specify the beta version(s) you want to use.
          #
          #   @option params [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
          #
          # @return [Anthropic::Models::Beta::Messages::BetaMessageBatchIndividualResponse]
          #
          def results(message_batch_id, params = {})
            parsed, options = Anthropic::Models::Beta::Messages::BatchResultsParams.dump_request(params)
            @client.request(
              method: :get,
              path: ["v1/messages/batches/%0s/results?beta=true", message_batch_id],
              headers: {"Accept" => "application/x-jsonl", **parsed},
              model: Anthropic::Models::Beta::Messages::BetaMessageBatchIndividualResponse,
              options: options
            )
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
end
