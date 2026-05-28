# typed: strong

module Anthropic
  module Models
    class MessageDeltaUsage < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::MessageDeltaUsage, Anthropic::Internal::AnyHash)
        end

      # The cumulative number of input tokens used to create the cache entry.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :cache_creation_input_tokens

      # The cumulative number of input tokens read from the cache.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :cache_read_input_tokens

      # The cumulative number of input tokens which were used.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :input_tokens

      # The cumulative number of output tokens which were used.
      sig { returns(Integer) }
      attr_accessor :output_tokens

      # Breakdown of output tokens by category.
      #
      # `output_tokens` remains the inclusive, authoritative total used for billing.
      # This object provides a read-only decomposition for observability — for example,
      # how many of the billed output tokens were spent on internal reasoning that may
      # have been summarized before being returned to you.
      sig { returns(T.nilable(Anthropic::OutputTokensDetails)) }
      attr_reader :output_tokens_details

      sig do
        params(
          output_tokens_details:
            T.nilable(Anthropic::OutputTokensDetails::OrHash)
        ).void
      end
      attr_writer :output_tokens_details

      # The number of server tool requests.
      sig { returns(T.nilable(Anthropic::ServerToolUsage)) }
      attr_reader :server_tool_use

      sig do
        params(
          server_tool_use: T.nilable(Anthropic::ServerToolUsage::OrHash)
        ).void
      end
      attr_writer :server_tool_use

      sig do
        params(
          cache_creation_input_tokens: T.nilable(Integer),
          cache_read_input_tokens: T.nilable(Integer),
          input_tokens: T.nilable(Integer),
          output_tokens: Integer,
          output_tokens_details:
            T.nilable(Anthropic::OutputTokensDetails::OrHash),
          server_tool_use: T.nilable(Anthropic::ServerToolUsage::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
        # The cumulative number of input tokens used to create the cache entry.
        cache_creation_input_tokens:,
        # The cumulative number of input tokens read from the cache.
        cache_read_input_tokens:,
        # The cumulative number of input tokens which were used.
        input_tokens:,
        # The cumulative number of output tokens which were used.
        output_tokens:,
        # Breakdown of output tokens by category.
        #
        # `output_tokens` remains the inclusive, authoritative total used for billing.
        # This object provides a read-only decomposition for observability — for example,
        # how many of the billed output tokens were spent on internal reasoning that may
        # have been summarized before being returned to you.
        output_tokens_details:,
        # The number of server tool requests.
        server_tool_use:
      )
      end

      sig do
        override.returns(
          {
            cache_creation_input_tokens: T.nilable(Integer),
            cache_read_input_tokens: T.nilable(Integer),
            input_tokens: T.nilable(Integer),
            output_tokens: Integer,
            output_tokens_details: T.nilable(Anthropic::OutputTokensDetails),
            server_tool_use: T.nilable(Anthropic::ServerToolUsage)
          }
        )
      end
      def to_hash
      end
    end
  end
end
