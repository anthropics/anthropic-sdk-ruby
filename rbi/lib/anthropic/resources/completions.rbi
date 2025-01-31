# typed: strong

module Anthropic
  module Resources
    class Completions
      sig do
        params(
          max_tokens_to_sample: Integer,
          model: Anthropic::Models::Model::Variants,
          prompt: String,
          metadata: Anthropic::Models::Metadata,
          stop_sequences: T::Array[String],
          stream: T::Boolean,
          temperature: Float,
          top_k: Integer,
          top_p: Float,
          request_options: Anthropic::RequestOpts
        ).returns(Anthropic::Models::Completion)
      end
      def create(
        max_tokens_to_sample:,
        model:,
        prompt:,
        metadata:,
        stop_sequences:,
        stream:,
        temperature:,
        top_k:,
        top_p:,
        request_options: {}
      ); end

      sig { params(client: Anthropic::Client).void }
      def initialize(client:); end
    end
  end
end
