# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Messages
        class Batches
          # @param client [Anthropic::Client]
          def initialize(client:)
            @client = client
          end

          # Send a batch of Message creation requests.
          #
          #   The Message Batches API can be used to process multiple Messages API requests at
          #   once. Once a Message Batch is created, it begins processing immediately. Batches
          #   can take up to 24 hours to complete.
          #
          # @param params [Hash{Symbol => Object}] Attributes to send in this request.
          #   @option params [Array<Anthropic::Models::Beta::Messages::BatchCreateParams::Request>] :requests Body param: List of requests for prompt completion. Each is an individual
          #     request to create a Message.
          #   @option params [Array<String, Symbol, Anthropic::Models::AnthropicBeta::UnnamedTypeWithunionParent14>, nil] :betas Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param opts [Hash{Symbol => Object}, Anthropic::RequestOptions] Options to specify HTTP behaviour for this request.
          #
          # @return [Anthropic::Models::Beta::Messages::BetaMessageBatch]
          def create(params = {}, opts = {})
            req = {
              method: :post,
              path: "/v1/messages/batches?beta=true",
              headers: {"Content-Type" => "application/json"},
              body: params,
              model: Anthropic::Models::Beta::Messages::BetaMessageBatch
            }
            @client.request(req, opts)
          end

          # This endpoint is idempotent and can be used to poll for Message Batch
          #   completion. To access the results of a Message Batch, make a request to the
          #   `results_url` field in the response.
          #
          # @param message_batch_id [String] ID of the Message Batch.
          #
          # @param params [Hash{Symbol => Object}] Attributes to send in this request.
          #   @option params [Array<String, Symbol, Anthropic::Models::AnthropicBeta::UnnamedTypeWithunionParent15>, nil] :betas Optional header to specify the beta version(s) you want to use.
          #
          # @param opts [Hash{Symbol => Object}, Anthropic::RequestOptions] Options to specify HTTP behaviour for this request.
          #
          # @return [Anthropic::Models::Beta::Messages::BetaMessageBatch]
          def retrieve(message_batch_id, _params = {}, opts = {})
            req = {
              method: :get,
              path: "/v1/messages/batches/#{message_batch_id}?beta=true",
              model: Anthropic::Models::Beta::Messages::BetaMessageBatch
            }
            @client.request(req, opts)
          end

          # List all Message Batches within a Workspace. Most recently created batches are
          #   returned first.
          #
          # @param params [Hash{Symbol => Object}] Attributes to send in this request.
          #   @option params [String, nil] :after_id Query param: ID of the object to use as a cursor for pagination. When provided,
          #     returns the page of results immediately after this object.
          #   @option params [String, nil] :before_id Query param: ID of the object to use as a cursor for pagination. When provided,
          #     returns the page of results immediately before this object.
          #   @option params [Integer, nil] :limit Query param: Number of items to return per page.
          #
          #     Defaults to `20`. Ranges from `1` to `100`.
          #   @option params [Array<String, Symbol, Anthropic::Models::AnthropicBeta::UnnamedTypeWithunionParent16>, nil] :betas Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param opts [Hash{Symbol => Object}, Anthropic::RequestOptions] Options to specify HTTP behaviour for this request.
          #
          # @return [Anthropic::Page<Anthropic::Models::Beta::Messages::BetaMessageBatch>]
          def list(params = {}, opts = {})
            req = {
              method: :get,
              path: "/v1/messages/batches?beta=true",
              query: params,
              page: Anthropic::Page,
              model: Anthropic::Models::Beta::Messages::BetaMessageBatch
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
          # @param params [Hash{Symbol => Object}] Attributes to send in this request.
          #   @option params [Array<String, Symbol, Anthropic::Models::AnthropicBeta::UnnamedTypeWithunionParent17>, nil] :betas Optional header to specify the beta version(s) you want to use.
          #
          # @param opts [Hash{Symbol => Object}, Anthropic::RequestOptions] Options to specify HTTP behaviour for this request.
          #
          # @return [Anthropic::Models::Beta::Messages::BetaMessageBatch]
          def cancel(message_batch_id, _params = {}, opts = {})
            req = {
              method: :post,
              path: "/v1/messages/batches/#{message_batch_id}/cancel?beta=true",
              model: Anthropic::Models::Beta::Messages::BetaMessageBatch
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
          # @param params [Hash{Symbol => Object}] Attributes to send in this request.
          #   @option params [Array<String, Symbol, Anthropic::Models::AnthropicBeta::UnnamedTypeWithunionParent18>, nil] :betas Optional header to specify the beta version(s) you want to use.
          #
          # @param opts [Hash{Symbol => Object}, Anthropic::RequestOptions] Options to specify HTTP behaviour for this request.
          #
          # @return [Object]
          def results(message_batch_id, _params = {}, opts = {})
            req = {
              method: :get,
              path: "/v1/messages/batches/#{message_batch_id}/results?beta=true",
              headers: {"Accept" => "application/binary"},
              model: Anthropic::Unknown
            }
            @client.request(req, opts)
          end
        end
      end
    end
  end
end
