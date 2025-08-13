# typed: strong

module Anthropic
  module Models
    class CacheCreation < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::CacheCreation, Anthropic::Internal::AnyHash)
        end

      # The number of input tokens used to create the 1 hour cache entry.
      sig { returns(Integer) }
      attr_accessor :ephemeral_1h_input_tokens

      # The number of input tokens used to create the 5 minute cache entry.
      sig { returns(Integer) }
      attr_accessor :ephemeral_5m_input_tokens

      sig do
        params(
          ephemeral_1h_input_tokens: Integer,
          ephemeral_5m_input_tokens: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # The number of input tokens used to create the 1 hour cache entry.
        ephemeral_1h_input_tokens:,
        # The number of input tokens used to create the 5 minute cache entry.
        ephemeral_5m_input_tokens:
      )
      end

      sig do
        override.returns(
          {
            ephemeral_1h_input_tokens: Integer,
            ephemeral_5m_input_tokens: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
