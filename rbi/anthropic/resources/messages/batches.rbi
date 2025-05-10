# typed: strong

module Anthropic
  module Resources
    class Messages
      class Batches
        # Send a batch of Message creation requests.
        #
        # The Message Batches API can be used to process multiple Messages API requests at
        # once. Once a Message Batch is created, it begins processing immediately. Batches
        # can take up to 24 hours to complete.
        #
        # Learn more about the Message Batches API in our
        # [user guide](/en/docs/build-with-claude/batch-processing)
        sig do
          params(
            requests:
              T::Array[Anthropic::Messages::BatchCreateParams::Request::OrHash],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Messages::MessageBatch)
        end
        def create(
          # List of requests for prompt completion. Each is an individual request to create
          # a Message.
          requests:,
          request_options: {}
        )
        end

        # This endpoint is idempotent and can be used to poll for Message Batch
        # completion. To access the results of a Message Batch, make a request to the
        # `results_url` field in the response.
        #
        # Learn more about the Message Batches API in our
        # [user guide](/en/docs/build-with-claude/batch-processing)
        sig do
          params(
            message_batch_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Messages::MessageBatch)
        end
        def retrieve(
          # ID of the Message Batch.
          message_batch_id,
          request_options: {}
        )
        end

        # List all Message Batches within a Workspace. Most recently created batches are
        # returned first.
        #
        # Learn more about the Message Batches API in our
        # [user guide](/en/docs/build-with-claude/batch-processing)
        sig do
          params(
            after_id: String,
            before_id: String,
            limit: Integer,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(
            Anthropic::Internal::Page[Anthropic::Messages::MessageBatch]
          )
        end
        def list(
          # ID of the object to use as a cursor for pagination. When provided, returns the
          # page of results immediately after this object.
          after_id: nil,
          # ID of the object to use as a cursor for pagination. When provided, returns the
          # page of results immediately before this object.
          before_id: nil,
          # Number of items to return per page.
          #
          # Defaults to `20`. Ranges from `1` to `1000`.
          limit: nil,
          request_options: {}
        )
        end

        # Delete a Message Batch.
        #
        # Message Batches can only be deleted once they've finished processing. If you'd
        # like to delete an in-progress batch, you must first cancel it.
        #
        # Learn more about the Message Batches API in our
        # [user guide](/en/docs/build-with-claude/batch-processing)
        sig do
          params(
            message_batch_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Messages::DeletedMessageBatch)
        end
        def delete(
          # ID of the Message Batch.
          message_batch_id,
          request_options: {}
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
        sig do
          params(
            message_batch_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Messages::MessageBatch)
        end
        def cancel(
          # ID of the Message Batch.
          message_batch_id,
          request_options: {}
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
        sig do
          params(
            message_batch_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(
            Anthropic::Internal::JsonLStream[
              Anthropic::Messages::MessageBatchIndividualResponse
            ]
          )
        end
        def results_streaming(
          # ID of the Message Batch.
          message_batch_id,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Anthropic::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
