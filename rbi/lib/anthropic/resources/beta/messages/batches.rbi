# typed: strong

module Anthropic
  module Resources
    class Beta
      class Messages
        class Batches
          sig do
            params(
              requests: T::Array[Anthropic::Models::Beta::Messages::BatchCreateParams::Request],
              betas: T::Array[Anthropic::Models::AnthropicBeta::Variants],
              request_options: Anthropic::RequestOpts
            ).returns(Anthropic::Models::Beta::Messages::BetaMessageBatch)
          end
          def create(requests:, betas:, request_options: {}); end

          sig do
            params(
              message_batch_id: String,
              betas: T::Array[Anthropic::Models::AnthropicBeta::Variants],
              request_options: Anthropic::RequestOpts
            ).returns(Anthropic::Models::Beta::Messages::BetaMessageBatch)
          end
          def retrieve(message_batch_id, betas:, request_options: {}); end

          sig do
            params(
              after_id: String,
              before_id: String,
              limit: Integer,
              betas: T::Array[Anthropic::Models::AnthropicBeta::Variants],
              request_options: Anthropic::RequestOpts
            ).returns(Anthropic::Page[Anthropic::Models::Beta::Messages::BetaMessageBatch])
          end
          def list(after_id:, before_id:, limit:, betas:, request_options: {}); end

          sig do
            params(
              message_batch_id: String,
              betas: T::Array[Anthropic::Models::AnthropicBeta::Variants],
              request_options: Anthropic::RequestOpts
            ).returns(Anthropic::Models::Beta::Messages::BetaDeletedMessageBatch)
          end
          def delete(message_batch_id, betas:, request_options: {}); end

          sig do
            params(
              message_batch_id: String,
              betas: T::Array[Anthropic::Models::AnthropicBeta::Variants],
              request_options: Anthropic::RequestOpts
            ).returns(Anthropic::Models::Beta::Messages::BetaMessageBatch)
          end
          def cancel(message_batch_id, betas:, request_options: {}); end

          sig do
            params(
              message_batch_id: String,
              betas: T::Array[Anthropic::Models::AnthropicBeta::Variants],
              request_options: Anthropic::RequestOpts
            ).returns(Anthropic::Models::Beta::Messages::BetaMessageBatchIndividualResponse)
          end
          def results(message_batch_id, betas:, request_options: {}); end

          sig { params(client: Anthropic::Client).void }
          def initialize(client:); end
        end
      end
    end
  end
end
