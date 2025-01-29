# typed: strong

module Anthropic
  module Models
    module Beta
      class MessageCreateParams < Anthropic::BaseModel
        extend Anthropic::RequestParameters::Converter
        include Anthropic::RequestParameters

        Shape = T.type_alias do
          T.all(
            {
              max_tokens: Integer,
              messages: T::Array[Anthropic::Models::Beta::BetaMessageParam],
              model: Anthropic::Models::Model::Variants,
              metadata: Anthropic::Models::Beta::BetaMetadata,
              stop_sequences: T::Array[String],
              stream: T::Boolean,
              system_: Anthropic::Models::Beta::MessageCreateParams::System::Variants,
              temperature: Float,
              tool_choice: Anthropic::Models::Beta::BetaToolChoice::Variants,
              tools: T::Array[Anthropic::Models::Beta::BetaToolUnion::Variants],
              top_k: Integer,
              top_p: Float,
              betas: T::Array[Anthropic::Models::AnthropicBeta::Variants]
            },
            Anthropic::RequestParameters::Shape
          )
        end

        sig { returns(Integer) }
        attr_accessor :max_tokens

        sig { returns(T::Array[Anthropic::Models::Beta::BetaMessageParam]) }
        attr_accessor :messages

        sig { returns(Anthropic::Models::Model::Variants) }
        attr_accessor :model

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaMetadata)) }
        attr_reader :metadata

        sig { params(metadata: Anthropic::Models::Beta::BetaMetadata).void }
        attr_writer :metadata

        sig { returns(T::Array[String]) }
        attr_reader :stop_sequences

        sig { params(stop_sequences: T::Array[String]).void }
        attr_writer :stop_sequences

        sig { returns(T::Boolean) }
        attr_accessor :stream

        sig { returns(T.nilable(Anthropic::Models::Beta::MessageCreateParams::System::Variants)) }
        attr_reader :system_

        sig { params(system_: Anthropic::Models::Beta::MessageCreateParams::System::Variants).void }
        attr_writer :system_

        sig { returns(T.nilable(Float)) }
        attr_reader :temperature

        sig { params(temperature: Float).void }
        attr_writer :temperature

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaToolChoice::Variants)) }
        attr_reader :tool_choice

        sig { params(tool_choice: Anthropic::Models::Beta::BetaToolChoice::Variants).void }
        attr_writer :tool_choice

        sig { returns(T::Array[Anthropic::Models::Beta::BetaToolUnion::Variants]) }
        attr_reader :tools

        sig { params(tools: T::Array[Anthropic::Models::Beta::BetaToolUnion::Variants]).void }
        attr_writer :tools

        sig { returns(T.nilable(Integer)) }
        attr_reader :top_k

        sig { params(top_k: Integer).void }
        attr_writer :top_k

        sig { returns(T.nilable(Float)) }
        attr_reader :top_p

        sig { params(top_p: Float).void }
        attr_writer :top_p

        sig { returns(T::Array[Anthropic::Models::AnthropicBeta::Variants]) }
        attr_reader :betas

        sig { params(betas: T::Array[Anthropic::Models::AnthropicBeta::Variants]).void }
        attr_writer :betas

        sig do
          params(
            max_tokens: Integer,
            messages: T::Array[Anthropic::Models::Beta::BetaMessageParam],
            model: Anthropic::Models::Model::Variants,
            stream: T::Boolean,
            metadata: Anthropic::Models::Beta::BetaMetadata,
            stop_sequences: T::Array[String],
            system_: Anthropic::Models::Beta::MessageCreateParams::System::Variants,
            temperature: Float,
            tool_choice: Anthropic::Models::Beta::BetaToolChoice::Variants,
            tools: T::Array[Anthropic::Models::Beta::BetaToolUnion::Variants],
            top_k: Integer,
            top_p: Float,
            betas: T::Array[Anthropic::Models::AnthropicBeta::Variants],
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
          betas: nil,
          request_options: {}
        ); end

        sig { returns(Anthropic::Models::Beta::MessageCreateParams::Shape) }
        def to_h; end

        class Stream < Anthropic::Enum
          abstract!

          TRUE = T.let(true, T::Boolean)

          sig { returns(T::Array[T::Boolean]) }
          def self.values; end
        end

        class System < Anthropic::Union
          abstract!

          Variants = T.type_alias { T.any(String, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]) }

          BetaTextBlockParamArray = T.type_alias { T::Array[Anthropic::Models::Beta::BetaTextBlockParam] }

          sig do
            returns([[NilClass, String], [NilClass, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]]])
          end
          private_class_method def self.variants; end
        end
      end
    end
  end
end
