# typed: strong

module Anthropic
  module Models
    class MessageCreateParams < Anthropic::BaseModel
      extend Anthropic::RequestParameters::Converter
      include Anthropic::RequestParameters

      sig { returns(Integer) }
      def max_tokens
      end

      sig { params(_: Integer).returns(Integer) }
      def max_tokens=(_)
      end

      sig { returns(T::Array[Anthropic::Models::MessageParam]) }
      def messages
      end

      sig { params(_: T::Array[Anthropic::Models::MessageParam]).returns(T::Array[Anthropic::Models::MessageParam]) }
      def messages=(_)
      end

      sig { returns(T.any(Symbol, String)) }
      def model
      end

      sig { params(_: T.any(Symbol, String)).returns(T.any(Symbol, String)) }
      def model=(_)
      end

      sig { returns(T.nilable(Anthropic::Models::Metadata)) }
      def metadata
      end

      sig { params(_: Anthropic::Models::Metadata).returns(Anthropic::Models::Metadata) }
      def metadata=(_)
      end

      sig { returns(T.nilable(T::Array[String])) }
      def stop_sequences
      end

      sig { params(_: T::Array[String]).returns(T::Array[String]) }
      def stop_sequences=(_)
      end

      sig { returns(T::Boolean) }
      def stream
      end

      sig { params(_: T::Boolean).returns(T::Boolean) }
      def stream=(_)
      end

      sig { returns(T.nilable(T.any(String, T::Array[Anthropic::Models::TextBlockParam]))) }
      def system_
      end

      sig do
        params(_: T.any(String, T::Array[Anthropic::Models::TextBlockParam]))
          .returns(T.any(String, T::Array[Anthropic::Models::TextBlockParam]))
      end
      def system_=(_)
      end

      sig { returns(T.nilable(Float)) }
      def temperature
      end

      sig { params(_: Float).returns(Float) }
      def temperature=(_)
      end

      sig do
        returns(
          T.nilable(
            T.any(
              Anthropic::Models::ToolChoiceAuto,
              Anthropic::Models::ToolChoiceAny,
              Anthropic::Models::ToolChoiceTool
            )
          )
        )
      end
      def tool_choice
      end

      sig do
        params(
          _: T.any(
            Anthropic::Models::ToolChoiceAuto,
            Anthropic::Models::ToolChoiceAny,
            Anthropic::Models::ToolChoiceTool
          )
        )
          .returns(
            T.any(
              Anthropic::Models::ToolChoiceAuto,
              Anthropic::Models::ToolChoiceAny,
              Anthropic::Models::ToolChoiceTool
            )
          )
      end
      def tool_choice=(_)
      end

      sig { returns(T.nilable(T::Array[Anthropic::Models::Tool])) }
      def tools
      end

      sig { params(_: T::Array[Anthropic::Models::Tool]).returns(T::Array[Anthropic::Models::Tool]) }
      def tools=(_)
      end

      sig { returns(T.nilable(Integer)) }
      def top_k
      end

      sig { params(_: Integer).returns(Integer) }
      def top_k=(_)
      end

      sig { returns(T.nilable(Float)) }
      def top_p
      end

      sig { params(_: Float).returns(Float) }
      def top_p=(_)
      end

      sig do
        params(
          max_tokens: Integer,
          messages: T::Array[Anthropic::Models::MessageParam],
          model: T.any(Symbol, String),
          stream: T::Boolean,
          metadata: Anthropic::Models::Metadata,
          stop_sequences: T::Array[String],
          system_: T.any(String, T::Array[Anthropic::Models::TextBlockParam]),
          temperature: Float,
          tool_choice: T.any(
            Anthropic::Models::ToolChoiceAuto,
            Anthropic::Models::ToolChoiceAny,
            Anthropic::Models::ToolChoiceTool
          ),
          tools: T::Array[Anthropic::Models::Tool],
          top_k: Integer,
          top_p: Float,
          request_options: T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .void
      end
      def initialize(
        max_tokens:,
        messages:,
        model:,
        stream:,
        metadata: nil,
        stop_sequences: nil,
        system_: nil,
        temperature: nil,
        tool_choice: nil,
        tools: nil,
        top_k: nil,
        top_p: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              max_tokens: Integer,
              messages: T::Array[Anthropic::Models::MessageParam],
              model: T.any(Symbol, String),
              metadata: Anthropic::Models::Metadata,
              stop_sequences: T::Array[String],
              stream: T::Boolean,
              system_: T.any(String, T::Array[Anthropic::Models::TextBlockParam]),
              temperature: Float,
              tool_choice: T.any(
                Anthropic::Models::ToolChoiceAuto,
                Anthropic::Models::ToolChoiceAny,
                Anthropic::Models::ToolChoiceTool
              ),
              tools: T::Array[Anthropic::Models::Tool],
              top_k: Integer,
              top_p: Float,
              request_options: Anthropic::RequestOptions
            }
          )
      end
      def to_hash
      end

      class Stream < Anthropic::Enum
        abstract!

        TRUE = T.let(true, T::Boolean)

        sig { override.returns(T::Array[T::Boolean]) }
        def self.values
        end
      end

      class System < Anthropic::Union
        abstract!

        TextBlockParamArray = T.type_alias { T::Array[Anthropic::Models::TextBlockParam] }

        sig { override.returns([[NilClass, String], [NilClass, T::Array[Anthropic::Models::TextBlockParam]]]) }
        private_class_method def self.variants
        end
      end
    end
  end
end
