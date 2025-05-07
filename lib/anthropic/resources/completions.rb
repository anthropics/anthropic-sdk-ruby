# frozen_string_literal: true

module Anthropic
  module Resources
    class Completions
      # See {Anthropic::Resources::Completions#create_streaming} for streaming
      # counterpart.
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::CompletionCreateParams} for more details.
      #
      # [Legacy] Create a Text Completion.
      #
      # The Text Completions API is a legacy API. We recommend using the
      # [Messages API](https://docs.anthropic.com/en/api/messages) going forward.
      #
      # Future models and features will not be compatible with Text Completions. See our
      # [migration guide](https://docs.anthropic.com/en/api/migrating-from-text-completions-to-messages)
      # for guidance in migrating from Text Completions to Messages.
      #
      # @overload create(max_tokens_to_sample:, model:, prompt:, metadata: nil, stop_sequences: nil, temperature: nil, top_k: nil, top_p: nil, request_options: {})
      #
      # @param max_tokens_to_sample [Integer] The maximum number of tokens to generate before stopping.
      #
      # @param model [Symbol, String, Anthropic::Model] The model that will complete your prompt.\n\nSee [models](https://docs.anthropic
      #
      # @param prompt [String] The prompt that you want Claude to complete.
      #
      # @param metadata [Anthropic::Metadata] An object describing metadata about the request.
      #
      # @param stop_sequences [Array<String>] Sequences that will cause the model to stop generating.
      #
      # @param temperature [Float] Amount of randomness injected into the response.
      #
      # @param top_k [Integer] Only sample from the top K options for each subsequent token.
      #
      # @param top_p [Float] Use nucleus sampling.
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Completion]
      #
      # @see Anthropic::Models::CompletionCreateParams
      def create(params)
        parsed, options = Anthropic::CompletionCreateParams.dump_request(params)
        if parsed[:stream]
          message = "Please use `#create_streaming` for the streaming use case."
          raise ArgumentError.new(message)
        end
        @client.request(
          method: :post,
          path: "v1/complete",
          body: parsed,
          model: Anthropic::Completion,
          options: {timeout: 600, **options}
        )
      end

      # See {Anthropic::Resources::Completions#create} for non-streaming counterpart.
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::CompletionCreateParams} for more details.
      #
      # [Legacy] Create a Text Completion.
      #
      # The Text Completions API is a legacy API. We recommend using the
      # [Messages API](https://docs.anthropic.com/en/api/messages) going forward.
      #
      # Future models and features will not be compatible with Text Completions. See our
      # [migration guide](https://docs.anthropic.com/en/api/migrating-from-text-completions-to-messages)
      # for guidance in migrating from Text Completions to Messages.
      #
      # @overload create_streaming(max_tokens_to_sample:, model:, prompt:, metadata: nil, stop_sequences: nil, temperature: nil, top_k: nil, top_p: nil, request_options: {})
      #
      # @param max_tokens_to_sample [Integer] The maximum number of tokens to generate before stopping.
      #
      # @param model [Symbol, String, Anthropic::Model] The model that will complete your prompt.\n\nSee [models](https://docs.anthropic
      #
      # @param prompt [String] The prompt that you want Claude to complete.
      #
      # @param metadata [Anthropic::Metadata] An object describing metadata about the request.
      #
      # @param stop_sequences [Array<String>] Sequences that will cause the model to stop generating.
      #
      # @param temperature [Float] Amount of randomness injected into the response.
      #
      # @param top_k [Integer] Only sample from the top K options for each subsequent token.
      #
      # @param top_p [Float] Use nucleus sampling.
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Internal::Stream<Anthropic::Completion>]
      #
      # @see Anthropic::Models::CompletionCreateParams
      def create_streaming(params)
        parsed, options = Anthropic::CompletionCreateParams.dump_request(params)
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
          model: Anthropic::Completion,
          options: {timeout: 600, **options}
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
