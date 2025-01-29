# typed: strong

module Anthropic
  module Models
    class MessageCreateParams < Anthropic::BaseModel
      extend Anthropic::RequestParameters::Converter
      include Anthropic::RequestParameters

      Shape = T.type_alias do
        T.all(
          {
            max_tokens: Integer,
            messages: T::Array[Anthropic::Models::MessageParam],
            model: Anthropic::Models::Model::Variants,
            metadata: Anthropic::Models::Metadata,
            stop_sequences: T::Array[String],
            stream: T::Boolean,
            system_: Anthropic::Models::MessageCreateParams::System::Variants,
            temperature: Float,
            tool_choice: Anthropic::Models::ToolChoice::Variants,
            tools: T::Array[Anthropic::Models::Tool],
            top_k: Integer,
            top_p: Float
          },
          Anthropic::RequestParameters::Shape
        )
      end

      sig { returns(Integer) }
      attr_accessor :max_tokens

      sig { returns(T::Array[Anthropic::Models::MessageParam]) }
      attr_accessor :messages

      sig { returns(Anthropic::Models::Model::Variants) }
      attr_accessor :model

      sig { returns(T.nilable(Anthropic::Models::Metadata)) }
      attr_reader :metadata

      sig { params(metadata: Anthropic::Models::Metadata).void }
      attr_writer :metadata

      sig { returns(T::Array[String]) }
      attr_reader :stop_sequences

      sig { params(stop_sequences: T::Array[String]).void }
      attr_writer :stop_sequences

      sig { returns(T::Boolean) }
      attr_accessor :stream

      sig { returns(T.nilable(Anthropic::Models::MessageCreateParams::System::Variants)) }
      attr_reader :system_

      sig { params(system_: Anthropic::Models::MessageCreateParams::System::Variants).void }
      attr_writer :system_

      sig { returns(T.nilable(Float)) }
      attr_reader :temperature

      sig { params(temperature: Float).void }
      attr_writer :temperature

      sig { returns(T.nilable(Anthropic::Models::ToolChoice::Variants)) }
      attr_reader :tool_choice

      sig { params(tool_choice: Anthropic::Models::ToolChoice::Variants).void }
      attr_writer :tool_choice

      sig { returns(T::Array[Anthropic::Models::Tool]) }
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
          model: Anthropic::Models::Model::Variants,
          stream: T::Boolean,
          metadata: Anthropic::Models::Metadata,
          stop_sequences: T::Array[String],
          system_: Anthropic::Models::MessageCreateParams::System::Variants,
          temperature: Float,
          tool_choice: Anthropic::Models::ToolChoice::Variants,
          tools: T::Array[Anthropic::Models::Tool],
          top_k: Integer,
          top_p: Float,
          request_options: Anthropic::RequestOpts
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

      sig { returns(Anthropic::Models::MessageCreateParams::Shape) }
      def to_h; end

      class Stream < Anthropic::Enum
        abstract!

        TRUE = T.let(true, T::Boolean)

        sig { returns(T::Array[T::Boolean]) }
        def self.values; end
      end

      class System < Anthropic::Union
        abstract!

        Variants = T.type_alias { T.any(String, T::Array[Anthropic::Models::TextBlockParam]) }

        TextBlockParamArray = T.type_alias { T::Array[Anthropic::Models::TextBlockParam] }

        sig { returns([[NilClass, String], [NilClass, T::Array[Anthropic::Models::TextBlockParam]]]) }
        private_class_method def self.variants; end
      end
    end
  end
end
