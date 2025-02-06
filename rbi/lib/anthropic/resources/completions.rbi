# typed: strong

module Anthropic
  module Resources
    class Completions
      sig do
        params(
          max_tokens_to_sample: Integer,
          model: Anthropic::Models::Model::Variants,
          prompt: String,
          stream: T::Boolean,
          metadata: Anthropic::Models::Metadata,
          stop_sequences: T::Array[String],
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
        stream: nil,
        metadata: nil,
        stop_sequences: nil,
        temperature: nil,
        top_k: nil,
        top_p: nil,
        request_options: {}
      ); end

      sig { params(client: Anthropic::Client).void }
      def initialize(client:); end
    end
  end
end
