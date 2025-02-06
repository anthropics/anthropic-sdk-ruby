# typed: strong

module Anthropic
  module Models
    class MessageCountTokensParams < Anthropic::BaseModel
      extend Anthropic::RequestParameters::Converter
      include Anthropic::RequestParameters

      sig { returns(T::Array[Anthropic::Models::MessageParam]) }
      attr_accessor :messages

      sig { returns(T.any(Symbol, String)) }
      attr_accessor :model

      sig { returns(T.nilable(T.any(String, T::Array[Anthropic::Models::TextBlockParam]))) }
      attr_reader :system_

      sig { params(system_: T.any(String, T::Array[Anthropic::Models::TextBlockParam])).void }
      attr_writer :system_

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

      sig do
        params(
          messages: T::Array[Anthropic::Models::MessageParam],
          model: T.any(Symbol, String),
          system_: T.any(String, T::Array[Anthropic::Models::TextBlockParam]),
          tool_choice: T.any(
            Anthropic::Models::ToolChoiceAuto,
            Anthropic::Models::ToolChoiceAny,
            Anthropic::Models::ToolChoiceTool
          ),
          tools: T::Array[Anthropic::Models::Tool],
          request_options: T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything])
        ).void
      end
      def initialize(messages:, model:, system_: nil, tool_choice: nil, tools: nil, request_options: {}); end

      sig do
        override.returns(
          {
            messages: T::Array[Anthropic::Models::MessageParam],
            model: T.any(Symbol, String),
            system_: T.any(String, T::Array[Anthropic::Models::TextBlockParam]),
            tool_choice: T.any(
              Anthropic::Models::ToolChoiceAuto,
              Anthropic::Models::ToolChoiceAny,
              Anthropic::Models::ToolChoiceTool
            ),
            tools: T::Array[Anthropic::Models::Tool],
            request_options: Anthropic::RequestOptions
          }
        )
      end
      def to_hash; end

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
