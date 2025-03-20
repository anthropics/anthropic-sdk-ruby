# typed: strong

module Anthropic
  module Models
    class CompletionCreateParams < Anthropic::BaseModel
      extend Anthropic::RequestParameters::Converter
      include Anthropic::RequestParameters

      # The maximum number of tokens to generate before stopping.
      #
      #   Note that our models may stop _before_ reaching this maximum. This parameter
      #   only specifies the absolute maximum number of tokens to generate.
      sig { returns(Integer) }
      def max_tokens_to_sample
      end

      sig { params(_: Integer).returns(Integer) }
      def max_tokens_to_sample=(_)
      end

      # The model that will complete your prompt.\n\nSee
      #   [models](https://docs.anthropic.com/en/docs/models-overview) for additional
      #   details and options.
      sig { returns(T.any(Anthropic::Models::Model::OrSymbol, String)) }
      def model
      end

      sig do
        params(_: T.any(Anthropic::Models::Model::OrSymbol, String))
          .returns(T.any(Anthropic::Models::Model::OrSymbol, String))
      end
      def model=(_)
      end

      # The prompt that you want Claude to complete.
      #
      #   For proper response generation you will need to format your prompt using
      #   alternating `\n\nHuman:` and `\n\nAssistant:` conversational turns. For example:
      #
      #   ```
      #   "\n\nHuman: {userQuestion}\n\nAssistant:"
      #   ```
      #
      #   See [prompt validation](https://docs.anthropic.com/en/api/prompt-validation) and
      #   our guide to
      #   [prompt design](https://docs.anthropic.com/en/docs/intro-to-prompting) for more
      #   details.
      sig { returns(String) }
      def prompt
      end

      sig { params(_: String).returns(String) }
      def prompt=(_)
      end

      # An object describing metadata about the request.
      sig { returns(T.nilable(Anthropic::Models::Metadata)) }
      def metadata
      end

      sig { params(_: Anthropic::Models::Metadata).returns(Anthropic::Models::Metadata) }
      def metadata=(_)
      end

      # Sequences that will cause the model to stop generating.
      #
      #   Our models stop on `"\n\nHuman:"`, and may include additional built-in stop
      #   sequences in the future. By providing the stop_sequences parameter, you may
      #   include additional strings that will cause the model to stop generating.
      sig { returns(T.nilable(T::Array[String])) }
      def stop_sequences
      end

      sig { params(_: T::Array[String]).returns(T::Array[String]) }
      def stop_sequences=(_)
      end

      # Amount of randomness injected into the response.
      #
      #   Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
      #   for analytical / multiple choice, and closer to `1.0` for creative and
      #   generative tasks.
      #
      #   Note that even with `temperature` of `0.0`, the results will not be fully
      #   deterministic.
      sig { returns(T.nilable(Float)) }
      def temperature
      end

      sig { params(_: Float).returns(Float) }
      def temperature=(_)
      end

      # Only sample from the top K options for each subsequent token.
      #
      #   Used to remove "long tail" low probability responses.
      #   [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
      #
      #   Recommended for advanced use cases only. You usually only need to use
      #   `temperature`.
      sig { returns(T.nilable(Integer)) }
      def top_k
      end

      sig { params(_: Integer).returns(Integer) }
      def top_k=(_)
      end

      # Use nucleus sampling.
      #
      #   In nucleus sampling, we compute the cumulative distribution over all the options
      #   for each subsequent token in decreasing probability order and cut it off once it
      #   reaches a particular probability specified by `top_p`. You should either alter
      #   `temperature` or `top_p`, but not both.
      #
      #   Recommended for advanced use cases only. You usually only need to use
      #   `temperature`.
      sig { returns(T.nilable(Float)) }
      def top_p
      end

      sig { params(_: Float).returns(Float) }
      def top_p=(_)
      end

      sig do
        params(
          max_tokens_to_sample: Integer,
          model: T.any(Anthropic::Models::Model::OrSymbol, String),
          prompt: String,
          metadata: Anthropic::Models::Metadata,
          stop_sequences: T::Array[String],
          temperature: Float,
          top_k: Integer,
          top_p: Float,
          request_options: T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .returns(T.attached_class)
      end
      def self.new(
        max_tokens_to_sample:,
        model:,
        prompt:,
        metadata: nil,
        stop_sequences: nil,
        temperature: nil,
        top_k: nil,
        top_p: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              max_tokens_to_sample: Integer,
              model: T.any(Anthropic::Models::Model::OrSymbol, String),
              prompt: String,
              metadata: Anthropic::Models::Metadata,
              stop_sequences: T::Array[String],
              temperature: Float,
              top_k: Integer,
              top_p: Float,
              request_options: Anthropic::RequestOptions
            }
          )
      end
      def to_hash
      end
    end
  end
end
