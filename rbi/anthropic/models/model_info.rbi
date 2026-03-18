# typed: strong

module Anthropic
  module Models
    class ModelInfo < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ModelInfo, Anthropic::Internal::AnyHash)
        end

      # Unique model identifier.
      sig { returns(String) }
      attr_accessor :id

      # Model capability information.
      sig { returns(T.nilable(Anthropic::ModelCapabilities)) }
      attr_reader :capabilities

      sig do
        params(
          capabilities: T.nilable(Anthropic::ModelCapabilities::OrHash)
        ).void
      end
      attr_writer :capabilities

      # RFC 3339 datetime string representing the time at which the model was released.
      # May be set to an epoch value if the release date is unknown.
      sig { returns(Time) }
      attr_accessor :created_at

      # A human-readable name for the model.
      sig { returns(String) }
      attr_accessor :display_name

      # Maximum input context window size in tokens for this model.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :max_input_tokens

      # Maximum value for the `max_tokens` parameter when using this model.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :max_tokens

      # Object type.
      #
      # For Models, this is always `"model"`.
      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          id: String,
          capabilities: T.nilable(Anthropic::ModelCapabilities::OrHash),
          created_at: Time,
          display_name: String,
          max_input_tokens: T.nilable(Integer),
          max_tokens: T.nilable(Integer),
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique model identifier.
        id:,
        # Model capability information.
        capabilities:,
        # RFC 3339 datetime string representing the time at which the model was released.
        # May be set to an epoch value if the release date is unknown.
        created_at:,
        # A human-readable name for the model.
        display_name:,
        # Maximum input context window size in tokens for this model.
        max_input_tokens:,
        # Maximum value for the `max_tokens` parameter when using this model.
        max_tokens:,
        # Object type.
        #
        # For Models, this is always `"model"`.
        type: :model
      )
      end

      sig do
        override.returns(
          {
            id: String,
            capabilities: T.nilable(Anthropic::ModelCapabilities),
            created_at: Time,
            display_name: String,
            max_input_tokens: T.nilable(Integer),
            max_tokens: T.nilable(Integer),
            type: Symbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
