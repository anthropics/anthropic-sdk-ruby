# frozen_string_literal: true

module Anthropic
  module Models
    class CompletionCreateParams < Anthropic::BaseModel
      # @!attribute max_tokens_to_sample
      #   The maximum number of tokens to generate before stopping.
      #
      # Note that our models may stop _before_ reaching this maximum. This parameter only specifies the absolute maximum number of tokens to generate.
      #
      #   @return [Integer]
      required :max_tokens_to_sample, Integer

      # @!attribute model
      #   The model that will complete your prompt.\n\nSee [models](https://docs.anthropic.com/en/docs/models-overview) for additional details and options.
      #
      #   @return [String, Symbol, Anthropic::Models::Model::UnnamedTypeWithunionParent0]
      required :model, Anthropic::Unknown

      # @!attribute prompt
      #   The prompt that you want Claude to complete.
      #
      # For proper response generation you will need to format your prompt using alternating `\n\nHuman:` and `\n\nAssistant:` conversational turns. For example:
      #
      # ```
      # "\n\nHuman: {userQuestion}\n\nAssistant:"
      # ```
      #
      # See [prompt validation](https://docs.anthropic.com/en/api/prompt-validation) and our guide to [prompt design](https://docs.anthropic.com/en/docs/intro-to-prompting) for more details.
      #
      #   @return [String]
      required :prompt, String

      # @!attribute metadata
      #   An object describing metadata about the request.
      #
      #   @return [Anthropic::Models::Metadata]
      optional :metadata, -> { Anthropic::Models::Metadata }

      # @!attribute stop_sequences
      #   Sequences that will cause the model to stop generating.
      #
      # Our models stop on `"\n\nHuman:"`, and may include additional built-in stop sequences in the future. By providing the stop_sequences parameter, you may include additional strings that will cause the model to stop generating.
      #
      #   @return [Array<String>]
      optional :stop_sequences, Anthropic::ArrayOf[String]

      # @!attribute stream
      #   Whether to incrementally stream the response using server-sent events.
      #
      # See [streaming](https://docs.anthropic.com/en/api/streaming) for details.
      #
      #   @return [Boolean]
      required :stream, enum: -> { Anthropic::Models::CompletionCreateParams::Stream }

      # @!attribute temperature
      #   Amount of randomness injected into the response.
      #
      # Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0` for analytical / multiple choice, and closer to `1.0` for creative and generative tasks.
      #
      # Note that even with `temperature` of `0.0`, the results will not be fully deterministic.
      #
      #   @return [Float]
      optional :temperature, Float

      # @!attribute top_k
      #   Only sample from the top K options for each subsequent token.
      #
      # Used to remove "long tail" low probability responses. [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
      #
      # Recommended for advanced use cases only. You usually only need to use `temperature`.
      #
      #   @return [Integer]
      optional :top_k, Integer

      # @!attribute top_p
      #   Use nucleus sampling.
      #
      # In nucleus sampling, we compute the cumulative distribution over all the options for each subsequent token in decreasing probability order and cut it off once it reaches a particular probability specified by `top_p`. You should either alter `temperature` or `top_p`, but not both.
      #
      # Recommended for advanced use cases only. You usually only need to use `temperature`.
      #
      #   @return [Float]
      optional :top_p, Float

      # @!parse
      #   # @param max_tokens_to_sample [Integer] The maximum number of tokens to generate before stopping.
      #   #
      #   #   Note that our models may stop _before_ reaching this maximum. This parameter
      #   #   only specifies the absolute maximum number of tokens to generate.
      #   #
      #   # @param model [String] The model that will complete your prompt.\n\nSee
      #   #   [models](https://docs.anthropic.com/en/docs/models-overview) for additional
      #   #   details and options.
      #   #
      #   # @param prompt [String] The prompt that you want Claude to complete.
      #   #
      #   #   For proper response generation you will need to format your prompt using
      #   #   alternating `\n\nHuman:` and `\n\nAssistant:` conversational turns. For example:
      #   #
      #   #   ```
      #   #   "\n\nHuman: {userQuestion}\n\nAssistant:"
      #   #   ```
      #   #
      #   #   See [prompt validation](https://docs.anthropic.com/en/api/prompt-validation) and
      #   #   our guide to
      #   #   [prompt design](https://docs.anthropic.com/en/docs/intro-to-prompting) for more
      #   #   details.
      #   #
      #   # @param metadata [Anthropic::Models::Metadata, nil] An object describing metadata about the request.
      #   #
      #   # @param stop_sequences [Array<String>, nil] Sequences that will cause the model to stop generating.
      #   #
      #   #   Our models stop on `"\n\nHuman:"`, and may include additional built-in stop
      #   #   sequences in the future. By providing the stop_sequences parameter, you may
      #   #   include additional strings that will cause the model to stop generating.
      #   #
      #   # @param stream [Boolean] Whether to incrementally stream the response using server-sent events.
      #   #
      #   #   See [streaming](https://docs.anthropic.com/en/api/streaming) for details.
      #   #
      #   # @param temperature [Float, nil] Amount of randomness injected into the response.
      #   #
      #   #   Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
      #   #   for analytical / multiple choice, and closer to `1.0` for creative and
      #   #   generative tasks.
      #   #
      #   #   Note that even with `temperature` of `0.0`, the results will not be fully
      #   #   deterministic.
      #   #
      #   # @param top_k [Integer, nil] Only sample from the top K options for each subsequent token.
      #   #
      #   #   Used to remove "long tail" low probability responses.
      #   #   [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
      #   #
      #   #   Recommended for advanced use cases only. You usually only need to use
      #   #   `temperature`.
      #   #
      #   # @param top_p [Float, nil] Use nucleus sampling.
      #   #
      #   #   In nucleus sampling, we compute the cumulative distribution over all the options
      #   #   for each subsequent token in decreasing probability order and cut it off once it
      #   #   reaches a particular probability specified by `top_p`. You should either alter
      #   #   `temperature` or `top_p`, but not both.
      #   #
      #   #   Recommended for advanced use cases only. You usually only need to use
      #   #   `temperature`.
      #   #
      #   def initialize(
      #     max_tokens_to_sample:,
      #     model:,
      #     prompt:,
      #     metadata: nil,
      #     stop_sequences: nil,
      #     stream:,
      #     temperature: nil,
      #     top_k: nil,
      #     top_p: nil,
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # Whether to incrementally stream the response using server-sent events.
      #
      # See [streaming](https://docs.anthropic.com/en/api/streaming) for details.
      #
      # @example
      #
      # ```ruby
      # case enum
      # in true
      #   # ...
      # end
      # ```
      class Stream < Anthropic::Enum
        TRUE = true
      end
    end
  end
end
