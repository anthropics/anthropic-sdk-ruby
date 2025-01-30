# typed: strong

module Anthropic
  module Models
    class MessageCountTokensParams < Anthropic::BaseModel
      extend Anthropic::RequestParameters::Converter
      include Anthropic::RequestParameters

      Shape = T.type_alias do
        T.all(
          {
            messages: T::Array[Anthropic::Models::MessageParam],
            model: Anthropic::Models::Model::Variants,
            system_: Anthropic::Models::MessageCountTokensParams::System::Variants,
            tool_choice: Anthropic::Models::ToolChoice::Variants,
            tools: T::Array[Anthropic::Models::Tool]
          },
          Anthropic::RequestParameters::Shape
        )
      end

      sig { returns(T::Array[Anthropic::Models::MessageParam]) }
      attr_accessor :messages

      sig { returns(Anthropic::Models::Model::Variants) }
      attr_accessor :model

      sig { returns(T.nilable(Anthropic::Models::MessageCountTokensParams::System::Variants)) }
      attr_reader :system_

      sig { params(system_: Anthropic::Models::MessageCountTokensParams::System::Variants).void }
      attr_writer :system_

      sig { returns(T.nilable(Anthropic::Models::ToolChoice::Variants)) }
      attr_reader :tool_choice

      sig { params(tool_choice: Anthropic::Models::ToolChoice::Variants).void }
      attr_writer :tool_choice

      sig { returns(T.nilable(T::Array[Anthropic::Models::Tool])) }
      attr_reader :tools

      sig { params(tools: T::Array[Anthropic::Models::Tool]).void }
      attr_writer :tools

      sig do
        params(
          messages: T::Array[Anthropic::Models::MessageParam],
          model: Anthropic::Models::Model::Variants,
          system_: Anthropic::Models::MessageCountTokensParams::System::Variants,
          tool_choice: Anthropic::Models::ToolChoice::Variants,
          tools: T::Array[Anthropic::Models::Tool],
          request_options: Anthropic::RequestOpts
        ).void
      end
      def initialize(messages:, model:, system_: nil, tool_choice: nil, tools: nil, request_options: {}); end

      sig { returns(Anthropic::Models::MessageCountTokensParams::Shape) }
      def to_h; end

      class System < Anthropic::Union
        abstract!

        Variants = T.type_alias { T.any(String, T::Array[Anthropic::Models::TextBlockParam]) }

        TextBlockParamArray = T.type_alias { T::Array[Anthropic::Models::TextBlockParam] }

        sig do
          override.returns([[NilClass, String], [NilClass, T::Array[Anthropic::Models::TextBlockParam]]])
        end
        private_class_method def self.variants; end
      end
    end
  end
end
