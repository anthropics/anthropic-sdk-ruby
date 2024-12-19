# frozen_string_literal: true

module Anthropic
  module Resources
    class Completions
      # @param client [Anthropic::Client]
      def initialize(client:)
        @client = client
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
      # @param params [Hash{Symbol => Object}, Anthropic::Models::CompletionCreateParams] Attributes to send in this request.
      #
      #   @option params [Integer] :max_tokens_to_sample The maximum number of tokens to generate before stopping.
      #
      #     Note that our models may stop _before_ reaching this maximum. This parameter
      #     only specifies the absolute maximum number of tokens to generate.
      #
      #   @option params [String, Symbol, Anthropic::Models::Model::UnionMember1] :model The model that will complete your prompt.\n\nSee
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
      #   @option params [Anthropic::Models::Metadata, nil] :metadata An object describing metadata about the request.
      #
      #   @option params [Array<String>, nil] :stop_sequences Sequences that will cause the model to stop generating.
      #
      #     Our models stop on `"\n\nHuman:"`, and may include additional built-in stop
      #     sequences in the future. By providing the stop_sequences parameter, you may
      #     include additional strings that will cause the model to stop generating.
      #
      #   @option params [Boolean] :stream Whether to incrementally stream the response using server-sent events.
      #
      #     See [streaming](https://docs.anthropic.com/en/api/streaming) for details.
      #
      #   @option params [Float, nil] :temperature Amount of randomness injected into the response.
      #
      #     Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
      #     for analytical / multiple choice, and closer to `1.0` for creative and
      #     generative tasks.
      #
      #     Note that even with `temperature` of `0.0`, the results will not be fully
      #     deterministic.
      #
      #   @option params [Integer, nil] :top_k Only sample from the top K options for each subsequent token.
      #
      #     Used to remove "long tail" low probability responses.
      #     [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
      #
      #     Recommended for advanced use cases only. You usually only need to use
      #     `temperature`.
      #
      #   @option params [Float, nil] :top_p Use nucleus sampling.
      #
      #     In nucleus sampling, we compute the cumulative distribution over all the options
      #     for each subsequent token in decreasing probability order and cut it off once it
      #     reaches a particular probability specified by `top_p`. You should either alter
      #     `temperature` or `top_p`, but not both.
      #
      #     Recommended for advanced use cases only. You usually only need to use
      #     `temperature`.
      #
      # @param opts [Hash{Symbol => Object}, Anthropic::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Anthropic::Models::Completion]
      def create(params = {}, opts = {})
        parsed = Anthropic::Models::CompletionCreateParams.dump(params)
        req = {
          method: :post,
          path: "/v1/complete",
          body: parsed,
          model: Anthropic::Models::Completion
        }
        @client.request(req, opts)
      end
    end
  end
end
