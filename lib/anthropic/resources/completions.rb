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
      # @param params [Anthropic::Models::CompletionCreateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Integer] :max_tokens_to_sample The maximum number of tokens to generate before stopping.
      #
      #     Note that our models may stop _before_ reaching this maximum. This parameter
      #     only specifies the absolute maximum number of tokens to generate.
      #
      #   @option params [Symbol, String] :model The model that will complete your prompt.\n\nSee
      #     [models](https://docs.anthropic.com/en/docs/models-overview) for additional
      #     details and options.
      #
      #   @option params [String] :prompt The prompt that you want Claude to complete.
      #
      #     For proper response generation you will need to format your prompt using
      #     alternating `\n\nHuman:` and `\n\nAssistant:` conversational turns. For example:
      #
      #     ```
      #     "\n\nHuman: {userQuestion}\n\nAssistant:"
      #     ```
      #
      #     See [prompt validation](https://docs.anthropic.com/en/api/prompt-validation) and
      #     our guide to
      #     [prompt design](https://docs.anthropic.com/en/docs/intro-to-prompting) for more
      #     details.
      #
      #   @option params [Anthropic::Models::Metadata] :metadata An object describing metadata about the request.
      #
      #   @option params [Array<String>] :stop_sequences Sequences that will cause the model to stop generating.
      #
      #     Our models stop on `"\n\nHuman:"`, and may include additional built-in stop
      #     sequences in the future. By providing the stop_sequences parameter, you may
      #     include additional strings that will cause the model to stop generating.
      #
      #   @option params [Float] :temperature Amount of randomness injected into the response.
      #
      #     Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
      #     for analytical / multiple choice, and closer to `1.0` for creative and
      #     generative tasks.
      #
      #     Note that even with `temperature` of `0.0`, the results will not be fully
      #     deterministic.
      #
      #   @option params [Integer] :top_k Only sample from the top K options for each subsequent token.
      #
      #     Used to remove "long tail" low probability responses.
      #     [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
      #
      #     Recommended for advanced use cases only. You usually only need to use
      #     `temperature`.
      #
      #   @option params [Float] :top_p Use nucleus sampling.
      #
      #     In nucleus sampling, we compute the cumulative distribution over all the options
      #     for each subsequent token in decreasing probability order and cut it off once it
      #     reaches a particular probability specified by `top_p`. You should either alter
      #     `temperature` or `top_p`, but not both.
      #
      #     Recommended for advanced use cases only. You usually only need to use
      #     `temperature`.
      #
      #   @option params [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
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
      # @param params [Anthropic::Models::CompletionCreateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Integer] :max_tokens_to_sample The maximum number of tokens to generate before stopping.
      #
      #     Note that our models may stop _before_ reaching this maximum. This parameter
      #     only specifies the absolute maximum number of tokens to generate.
      #
      #   @option params [Symbol, String] :model The model that will complete your prompt.\n\nSee
      #     [models](https://docs.anthropic.com/en/docs/models-overview) for additional
      #     details and options.
      #
      #   @option params [String] :prompt The prompt that you want Claude to complete.
      #
      #     For proper response generation you will need to format your prompt using
      #     alternating `\n\nHuman:` and `\n\nAssistant:` conversational turns. For example:
      #
      #     ```
      #     "\n\nHuman: {userQuestion}\n\nAssistant:"
      #     ```
      #
      #     See [prompt validation](https://docs.anthropic.com/en/api/prompt-validation) and
      #     our guide to
      #     [prompt design](https://docs.anthropic.com/en/docs/intro-to-prompting) for more
      #     details.
      #
      #   @option params [Anthropic::Models::Metadata] :metadata An object describing metadata about the request.
      #
      #   @option params [Array<String>] :stop_sequences Sequences that will cause the model to stop generating.
      #
      #     Our models stop on `"\n\nHuman:"`, and may include additional built-in stop
      #     sequences in the future. By providing the stop_sequences parameter, you may
      #     include additional strings that will cause the model to stop generating.
      #
      #   @option params [Float] :temperature Amount of randomness injected into the response.
      #
      #     Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
      #     for analytical / multiple choice, and closer to `1.0` for creative and
      #     generative tasks.
      #
      #     Note that even with `temperature` of `0.0`, the results will not be fully
      #     deterministic.
      #
      #   @option params [Integer] :top_k Only sample from the top K options for each subsequent token.
      #
      #     Used to remove "long tail" low probability responses.
      #     [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
      #
      #     Recommended for advanced use cases only. You usually only need to use
      #     `temperature`.
      #
      #   @option params [Float] :top_p Use nucleus sampling.
      #
      #     In nucleus sampling, we compute the cumulative distribution over all the options
      #     for each subsequent token in decreasing probability order and cut it off once it
      #     reaches a particular probability specified by `top_p`. You should either alter
      #     `temperature` or `top_p`, but not both.
      #
      #     Recommended for advanced use cases only. You usually only need to use
      #     `temperature`.
      #
      #   @option params [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Anthropic::Stream<Anthropic::Models::Completion>]
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
          stream: Anthropic::Stream,
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
