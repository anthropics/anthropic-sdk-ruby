# typed: strong

module Anthropic
  module Models
    module Beta
      class MessageCountTokensParams < Anthropic::BaseModel
        extend Anthropic::RequestParameters::Converter
        include Anthropic::RequestParameters

        Shape = T.type_alias do
          T.all(
            {
              messages: T::Array[Anthropic::Models::Beta::BetaMessageParam],
              model: Anthropic::Models::Model::Variants,
              system_: Anthropic::Models::Beta::MessageCountTokensParams::System::Variants,
              tool_choice: Anthropic::Models::Beta::BetaToolChoice::Variants,
              tools: T::Array[Anthropic::Models::Beta::MessageCountTokensParams::Tool::Variants],
              betas: T::Array[Anthropic::Models::AnthropicBeta::Variants]
            },
            Anthropic::RequestParameters::Shape
          )
        end

        sig { returns(T::Array[Anthropic::Models::Beta::BetaMessageParam]) }
        attr_accessor :messages

        sig { returns(Anthropic::Models::Model::Variants) }
        attr_accessor :model

        sig { returns(T.nilable(Anthropic::Models::Beta::MessageCountTokensParams::System::Variants)) }
        attr_reader :system_

        sig { params(system_: Anthropic::Models::Beta::MessageCountTokensParams::System::Variants).void }
        attr_writer :system_

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaToolChoice::Variants)) }
        attr_reader :tool_choice

        sig { params(tool_choice: Anthropic::Models::Beta::BetaToolChoice::Variants).void }
        attr_writer :tool_choice

        sig { returns(T::Array[Anthropic::Models::Beta::MessageCountTokensParams::Tool::Variants]) }
        attr_reader :tools

        sig do
          params(tools: T::Array[Anthropic::Models::Beta::MessageCountTokensParams::Tool::Variants]).void
        end
        attr_writer :tools

        sig { returns(T::Array[Anthropic::Models::AnthropicBeta::Variants]) }
        attr_reader :betas

        sig { params(betas: T::Array[Anthropic::Models::AnthropicBeta::Variants]).void }
        attr_writer :betas

        sig do
          params(
            messages: T::Array[Anthropic::Models::Beta::BetaMessageParam],
            model: Anthropic::Models::Model::Variants,
            system_: Anthropic::Models::Beta::MessageCountTokensParams::System::Variants,
            tool_choice: Anthropic::Models::Beta::BetaToolChoice::Variants,
            tools: T::Array[Anthropic::Models::Beta::MessageCountTokensParams::Tool::Variants],
            betas: T::Array[Anthropic::Models::AnthropicBeta::Variants],
            request_options: Anthropic::RequestOpts
          ).void
        end
        def initialize(
          messages:,
          model:,
          system_: nil,
          tool_choice: nil,
          tools: nil,
          betas: nil,
          request_options: {}
        )
        end

        sig { returns(Anthropic::Models::Beta::MessageCountTokensParams::Shape) }
        def to_h; end

        class System < Anthropic::Union
          abstract!

          Variants = T.type_alias { T.any(String, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]) }

          BetaTextBlockParamArray = T.type_alias { T::Array[Anthropic::Models::Beta::BetaTextBlockParam] }

          sig do
            returns([[NilClass, String], [NilClass, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]]])
          end
          private_class_method def self.variants; end
        end

        class Tool < Anthropic::Union
          abstract!

          Variants = T.type_alias do
            T.any(
              Anthropic::Models::Beta::BetaTool,
              Anthropic::Models::Beta::BetaToolComputerUse20241022,
              Anthropic::Models::Beta::BetaToolBash20241022,
              Anthropic::Models::Beta::BetaToolTextEditor20241022
            )
          end

          sig do
            returns(
              [
                [NilClass, Anthropic::Models::Beta::BetaTool],
                [NilClass, Anthropic::Models::Beta::BetaToolComputerUse20241022],
                [NilClass, Anthropic::Models::Beta::BetaToolBash20241022],
                [NilClass, Anthropic::Models::Beta::BetaToolTextEditor20241022]
              ]
            )
          end
          private_class_method def self.variants; end
        end
      end
    end
  end
end
