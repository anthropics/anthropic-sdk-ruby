# frozen_string_literal: true

module Anthropic
  module Resources
    class Completions
      # [Legacy] Create a Text Completion.
      #
      #   The Text Completions API is a legacy API. We recommend using the
      #   [Messages API](https://docs.anthropic.com/en/api/messages) going forward.
      #
      #   Future models and features will not be compatible with Text Completions. See our
      #   [migration guide](https://docs.anthropic.com/en/api/migrating-from-text-completions-to-messages)
      #   for guidance in migrating from Text Completions to Messages.
      #
      # @overload create(max_tokens_to_sample:, model:, prompt:, metadata: nil, stop_sequences: nil, temperature: nil, top_k: nil, top_p: nil, request_options: {})
      #
      # @param max_tokens_to_sample [Integer]
      # @param model [Symbol, String, Anthropic::Models::Model]
      # @param prompt [String]
      # @param metadata [Anthropic::Models::Metadata]
      # @param stop_sequences [Array<String>]
      # @param temperature [Float]
      # @param top_k [Integer]
      # @param top_p [Float]
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Models::Completion]
      #
      # @see Anthropic::Models::CompletionCreateParams
      def create(params)
        parsed, options = Anthropic::Models::CompletionCreateParams.dump_request(params)
        if parsed[:stream]
          message = "Please use `#create_streaming` for the streaming use case."
          raise ArgumentError.new(message)
        end
        @client.request(
          method: :post,
          path: "v1/complete",
          body: parsed,
          model: Anthropic::Models::Completion,
          options: options
        )
      end

      # [Legacy] Create a Text Completion.
      #
      #   The Text Completions API is a legacy API. We recommend using the
      #   [Messages API](https://docs.anthropic.com/en/api/messages) going forward.
      #
      #   Future models and features will not be compatible with Text Completions. See our
      #   [migration guide](https://docs.anthropic.com/en/api/migrating-from-text-completions-to-messages)
      #   for guidance in migrating from Text Completions to Messages.
      #
      # @overload create_streaming(max_tokens_to_sample:, model:, prompt:, metadata: nil, stop_sequences: nil, temperature: nil, top_k: nil, top_p: nil, request_options: {})
      #
      # @param max_tokens_to_sample [Integer]
      # @param model [Symbol, String, Anthropic::Models::Model]
      # @param prompt [String]
      # @param metadata [Anthropic::Models::Metadata]
      # @param stop_sequences [Array<String>]
      # @param temperature [Float]
      # @param top_k [Integer]
      # @param top_p [Float]
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Internal::Stream<Anthropic::Models::Completion>]
      #
      # @see Anthropic::Models::CompletionCreateParams
      def create_streaming(params)
        parsed, options = Anthropic::Models::CompletionCreateParams.dump_request(params)
        unless parsed.fetch(:stream, true)
          message = "Please use `#create` for the non-streaming use case."
          raise ArgumentError.new(message)
        end
        parsed.store(:stream, true)
        @client.request(
          method: :post,
          path: "v1/complete",
          headers: {"accept" => "text/event-stream"},
          body: parsed,
          stream: Anthropic::Internal::Stream,
          model: Anthropic::Models::Completion,
          options: options
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
