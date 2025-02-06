# typed: strong

module Anthropic
  module Models
    class MessageCreateParams < Anthropic::BaseModel
      extend Anthropic::RequestParameters::Converter
      include Anthropic::RequestParameters

      sig { returns(Integer) }
      attr_accessor :max_tokens

      sig { returns(T::Array[Anthropic::Models::MessageParam]) }
      attr_accessor :messages

      sig { returns(T.any(Symbol, String)) }
      attr_accessor :model

      sig { returns(T.nilable(Anthropic::Models::Metadata)) }
      attr_reader :metadata

      sig { params(metadata: Anthropic::Models::Metadata).void }
      attr_writer :metadata

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :stop_sequences

      sig { params(stop_sequences: T::Array[String]).void }
      attr_writer :stop_sequences

      sig { returns(T::Boolean) }
      attr_accessor :stream

      sig { returns(T.nilable(T.any(String, T::Array[Anthropic::Models::TextBlockParam]))) }
      attr_reader :system_

      sig { params(system_: T.any(String, T::Array[Anthropic::Models::TextBlockParam])).void }
      attr_writer :system_

      sig { returns(T.nilable(Float)) }
      attr_reader :temperature

      sig { params(temperature: Float).void }
      attr_writer :temperature

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
      attr_reader :tool_choice

      sig do
        params(
          tool_choice: T.any(
            Anthropic::Models::ToolChoiceAuto,
            Anthropic::Models::ToolChoiceAny,
            Anthropic::Models::ToolChoiceTool
          )
        ).void
      end
      attr_writer :tool_choice

      sig { returns(T.nilable(T::Array[Anthropic::Models::Tool])) }
      attr_reader :tools

      sig { params(tools: T::Array[Anthropic::Models::Tool]).void }
      attr_writer :tools

      sig { returns(T.nilable(Integer)) }
      attr_reader :top_k

      sig { params(top_k: Integer).void }
      attr_writer :top_k

      sig { returns(T.nilable(Float)) }
      attr_reader :top_p

      sig { params(top_p: Float).void }
      attr_writer :top_p

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
        ).void
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
      ); end

      sig do
        override.returns(
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
      def to_hash; end

      class Stream < Anthropic::Enum
        abstract!

        TRUE = T.let(true, T::Boolean)

        sig { override.returns(T::Array[T::Boolean]) }
        def self.values; end
      end

      class System < Anthropic::Union
        abstract!

        TextBlockParamArray = T.type_alias { T::Array[Anthropic::Models::TextBlockParam] }

        sig do
          override.returns([[NilClass, String], [NilClass, T::Array[Anthropic::Models::TextBlockParam]]])
        end
        private_class_method def self.variants; end
      end
    end
  end
end
