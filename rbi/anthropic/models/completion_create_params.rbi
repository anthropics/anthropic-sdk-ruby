# typed: strong

module Anthropic
  module Models
    class CompletionCreateParams < Anthropic::Internal::Type::BaseModel
      extend Anthropic::Internal::Type::RequestParameters::Converter
      include Anthropic::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Anthropic::CompletionCreateParams, Anthropic::Internal::AnyHash)
        end

      # The maximum number of tokens to generate before stopping.
      #
      # Note that our models may stop _before_ reaching this maximum. This parameter
      # only specifies the absolute maximum number of tokens to generate.
      sig { returns(Integer) }
      attr_accessor :max_tokens_to_sample

      # The model that will complete your prompt.\n\nSee
      # [models](https://docs.anthropic.com/en/docs/models-overview) for additional
      # details and options.
      sig { returns(T.any(Anthropic::Model::OrSymbol, String)) }
      attr_accessor :model

      # The prompt that you want Claude to complete.
      #
      # For proper response generation you will need to format your prompt using
      # alternating `\n\nHuman:` and `\n\nAssistant:` conversational turns. For example:
      #
      # ```
      # "\n\nHuman: {userQuestion}\n\nAssistant:"
      # ```
      #
      # See [prompt validation](https://docs.anthropic.com/en/api/prompt-validation) and
      # our guide to
      # [prompt design](https://docs.anthropic.com/en/docs/intro-to-prompting) for more
      # details.
      sig { returns(String) }
      attr_accessor :prompt

      # An object describing metadata about the request.
      sig { returns(T.nilable(Anthropic::Metadata)) }
      attr_reader :metadata

      sig { params(metadata: Anthropic::Metadata::OrHash).void }
      attr_writer :metadata

      # Sequences that will cause the model to stop generating.
      #
      # Our models stop on `"\n\nHuman:"`, and may include additional built-in stop
      # sequences in the future. By providing the stop_sequences parameter, you may
      # include additional strings that will cause the model to stop generating.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :stop_sequences

      sig { params(stop_sequences: T::Array[String]).void }
      attr_writer :stop_sequences

      # Amount of randomness injected into the response.
      #
      # Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
      # for analytical / multiple choice, and closer to `1.0` for creative and
      # generative tasks.
      #
      # Note that even with `temperature` of `0.0`, the results will not be fully
      # deterministic.
      sig { returns(T.nilable(Float)) }
      attr_reader :temperature

      sig { params(temperature: Float).void }
      attr_writer :temperature

      # Only sample from the top K options for each subsequent token.
      #
      # Used to remove "long tail" low probability responses.
      # [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
      #
      # Recommended for advanced use cases only. You usually only need to use
      # `temperature`.
      sig { returns(T.nilable(Integer)) }
      attr_reader :top_k

      sig { params(top_k: Integer).void }
      attr_writer :top_k

      # Use nucleus sampling.
      #
      # In nucleus sampling, we compute the cumulative distribution over all the options
      # for each subsequent token in decreasing probability order and cut it off once it
      # reaches a particular probability specified by `top_p`. You should either alter
      # `temperature` or `top_p`, but not both.
      #
      # Recommended for advanced use cases only. You usually only need to use
      # `temperature`.
      sig { returns(T.nilable(Float)) }
      attr_reader :top_p

      sig { params(top_p: Float).void }
      attr_writer :top_p

      # Optional header to specify the beta version(s) you want to use.
      sig do
        returns(
          T.nilable(T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)])
        )
      end
      attr_reader :betas

      sig do
        params(
          betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
        ).void
      end
      attr_writer :betas

      sig do
        params(
          max_tokens_to_sample: Integer,
          model: T.any(Anthropic::Model::OrSymbol, String),
          prompt: String,
          metadata: Anthropic::Metadata::OrHash,
          stop_sequences: T::Array[String],
          temperature: Float,
          top_k: Integer,
          top_p: Float,
          betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
          request_options: Anthropic::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The maximum number of tokens to generate before stopping.
        #
        # Note that our models may stop _before_ reaching this maximum. This parameter
        # only specifies the absolute maximum number of tokens to generate.
        max_tokens_to_sample:,
        # The model that will complete your prompt.\n\nSee
        # [models](https://docs.anthropic.com/en/docs/models-overview) for additional
        # details and options.
        model:,
        # The prompt that you want Claude to complete.
        #
        # For proper response generation you will need to format your prompt using
        # alternating `\n\nHuman:` and `\n\nAssistant:` conversational turns. For example:
        #
        # ```
        # "\n\nHuman: {userQuestion}\n\nAssistant:"
        # ```
        #
        # See [prompt validation](https://docs.anthropic.com/en/api/prompt-validation) and
        # our guide to
        # [prompt design](https://docs.anthropic.com/en/docs/intro-to-prompting) for more
        # details.
        prompt:,
        # An object describing metadata about the request.
        metadata: nil,
        # Sequences that will cause the model to stop generating.
        #
        # Our models stop on `"\n\nHuman:"`, and may include additional built-in stop
        # sequences in the future. By providing the stop_sequences parameter, you may
        # include additional strings that will cause the model to stop generating.
        stop_sequences: nil,
        # Amount of randomness injected into the response.
        #
        # Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
        # for analytical / multiple choice, and closer to `1.0` for creative and
        # generative tasks.
        #
        # Note that even with `temperature` of `0.0`, the results will not be fully
        # deterministic.
        temperature: nil,
        # Only sample from the top K options for each subsequent token.
        #
        # Used to remove "long tail" low probability responses.
        # [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
        #
        # Recommended for advanced use cases only. You usually only need to use
        # `temperature`.
        top_k: nil,
        # Use nucleus sampling.
        #
        # In nucleus sampling, we compute the cumulative distribution over all the options
        # for each subsequent token in decreasing probability order and cut it off once it
        # reaches a particular probability specified by `top_p`. You should either alter
        # `temperature` or `top_p`, but not both.
        #
        # Recommended for advanced use cases only. You usually only need to use
        # `temperature`.
        top_p: nil,
        # Optional header to specify the beta version(s) you want to use.
        betas: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            max_tokens_to_sample: Integer,
            model: T.any(Anthropic::Model::OrSymbol, String),
            prompt: String,
            metadata: Anthropic::Metadata,
            stop_sequences: T::Array[String],
            temperature: Float,
            top_k: Integer,
            top_p: Float,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
