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

          # Send a batch of requests to create Messages.
          #
          #   The Messages Batch API can be used to process multiple Messages API requests at
          #   once. Once a Message Batch is created, it begins processing immediately.
          #
          # @param params [Hash] Attributes to send in this request.
          # @option params [Array<Request>] :requests Body param: List of requests for prompt completion. Each is an individual
          #   request to create a Message.
          # @option params [Array<String, Symbol, Anthropic::Models::AnthropicBeta::UnnamedTypeWithunionParent13>, nil] :betas Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param opts [Hash, Anthropic::RequestOptions] Options to specify HTTP behaviour for this request.
          #
          # @return [Anthropic::Models::BetaMessageBatch]
          def create(params = {}, opts = {})
            req = {
              method: :post,
              path: "/v1/messages/batches?beta=true",
              body: params,
              headers: {"Content-Type" => "application/json"},
              model: Anthropic::Models::BetaMessageBatch
            }
            @client.request(req, opts)
          end

          # This endpoint is idempotent and can be used to poll for Message Batch
          #   completion. To access the results of a Message Batch, use the `responses_url`
          #   field in the response.
          #
          # @param message_batch_id [String] ID of the Message Batch.
          #
          # @param params [Hash] Attributes to send in this request.
          # @option params [Array<String, Symbol, Anthropic::Models::AnthropicBeta::UnnamedTypeWithunionParent14>, nil] :betas Optional header to specify the beta version(s) you want to use.
          #
          # @param opts [Hash, Anthropic::RequestOptions] Options to specify HTTP behaviour for this request.
          #
          # @return [Anthropic::Models::BetaMessageBatch]
          def retrieve(message_batch_id, _params = {}, opts = {})
            req = {
              method: :get,
              path: "/v1/messages/batches/#{message_batch_id}?beta=true",
              model: Anthropic::Models::BetaMessageBatch
            }
            @client.request(req, opts)
          end

          # List all Message Batches within a Workspace.
          #
          # @param params [Hash] Attributes to send in this request.
          # @option params [String, nil] :after_id Query param: ID of the object to use as a cursor for pagination. When provided,
          #   returns the page of results immediately after this object.
          # @option params [String, nil] :before_id Query param: ID of the object to use as a cursor for pagination. When provided,
          #   returns the page of results immediately before this object.
          # @option params [Integer, nil] :limit Query param: Number of items to return per page.
          #
          #   Defaults to `20`. Ranges from `1` to `100`.
          # @option params [Array<String, Symbol, Anthropic::Models::AnthropicBeta::UnnamedTypeWithunionParent15>, nil] :betas Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param opts [Hash, Anthropic::RequestOptions] Options to specify HTTP behaviour for this request.
          #
          # @return [Anthropic::Page<Anthropic::Models::BetaMessageBatch>]
          def list(params = {}, opts = {})
            req = {
              method: :get,
              path: "/v1/messages/batches?beta=true",
              query: params,
              page: Anthropic::Page,
              model: Anthropic::Models::BetaMessageBatch
            }
            @client.request(req, opts)
          end

          # Batches may be canceled any time before processing ends. The system may complete
          #   any in-progress, non-interruptible operations before finalizing cancellation.
          #
          # @param message_batch_id [String] ID of the Message Batch.
          #
          # @param params [Hash] Attributes to send in this request.
          # @option params [Array<String, Symbol, Anthropic::Models::AnthropicBeta::UnnamedTypeWithunionParent16>, nil] :betas Optional header to specify the beta version(s) you want to use.
          #
          # @param opts [Hash, Anthropic::RequestOptions] Options to specify HTTP behaviour for this request.
          #
          # @return [Anthropic::Models::BetaMessageBatch]
          def cancel(message_batch_id, _params = {}, opts = {})
            req = {
              method: :post,
              path: "/v1/messages/batches/#{message_batch_id}/cancel?beta=true",
              model: Anthropic::Models::BetaMessageBatch
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
          # @param params [Hash] Attributes to send in this request.
          # @option params [Array<String, Symbol, Anthropic::Models::AnthropicBeta::UnnamedTypeWithunionParent17>, nil] :betas Optional header to specify the beta version(s) you want to use.
          #
          # @param opts [Hash, Anthropic::RequestOptions] Options to specify HTTP behaviour for this request.
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
