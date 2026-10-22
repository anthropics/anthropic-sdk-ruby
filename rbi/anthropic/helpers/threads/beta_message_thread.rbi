# typed: strong

module Anthropic
  module Helpers
    module Threads
      # A conversation that the API keeps between requests, so that each turn sends only
      # the messages that are new. Create one with `client.beta.messages.thread(...)`.
      #
      # A thread runs one turn at a time and is not safe for concurrent use.
      class BetaMessageThread
        # The whole history: every message that was sent, every reply, and the messages
        # staged for the next turn.
        sig { returns(T::Array[T::Hash[Symbol, T.anything]]) }
        def messages
        end

        # The reply the next turn continues from, or `nil` when the next turn starts a new
        # thread.
        sig { returns(T.nilable(String)) }
        def previous_message_id
        end

        # What `client.beta.messages.thread` takes to create a thread that behaves the
        # same, with `messages` set to the whole history.
        sig { returns(T::Hash[Symbol, T.anything]) }
        def params
        end

        # Stages messages for the next turn without sending them.
        sig do
          params(
            messages:
              T.any(
                Anthropic::Beta::BetaMessageParam::Variants,
                Anthropic::Beta::BetaMessage,
                Anthropic::Internal::AnyHash
              )
          ).void
        end
        def append(*messages)
        end

        # Changes the thread's request fields for every later turn, where `nil` removes a
        # field. It sends no request. `system_` and `tools` cannot change once a turn has
        # created the thread.
        sig { params(params: T.anything).void }
        def update(**params)
        end

        # Returns a new, independent thread with this thread's history and request fields.
        # It sends no request.
        sig { returns(Anthropic::Helpers::Threads::BetaMessageThread) }
        def fork
        end

        # Creates a tool runner that runs over this thread. It sends no request.
        sig do
          params(max_iterations: T.nilable(Integer)).returns(
            Anthropic::Helpers::Tools::Runner
          )
        end
        def tool_runner(max_iterations: nil)
        end

        # Sends the messages staged with `#append`, followed by `messages`, as one turn
        # and returns the reply. `params` takes the keywords of `#update` and applies to
        # this turn only.
        sig do
          params(
            messages:
              T.any(
                Anthropic::Beta::BetaMessageParam::Variants,
                Anthropic::Beta::BetaMessage,
                Anthropic::Internal::AnyHash
              ),
            params: T.anything
          ).returns(Anthropic::Beta::BetaMessage)
        end
        def send_message(*messages, **params)
        end

        # Sends the next turn like `#send_message` and returns the stream of the reply.
        # The turn is in progress until the stream ends or is closed.
        sig do
          params(
            messages:
              T.any(
                Anthropic::Beta::BetaMessageParam::Variants,
                Anthropic::Beta::BetaMessage,
                Anthropic::Internal::AnyHash
              ),
            params: T.anything
          ).returns(Anthropic::Streaming::MessageStream)
        end
        def stream(*messages, **params)
        end
      end
    end
  end
end
