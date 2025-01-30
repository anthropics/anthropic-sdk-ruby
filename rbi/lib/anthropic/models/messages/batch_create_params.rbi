# typed: strong

module Anthropic
  module Models
    module Messages
      class BatchCreateParams < Anthropic::BaseModel
        extend Anthropic::RequestParameters::Converter
        include Anthropic::RequestParameters

        Shape = T.type_alias do
          T.all(
            {requests: T::Array[Anthropic::Models::Messages::BatchCreateParams::Request]},
            Anthropic::RequestParameters::Shape
          )
        end

        sig { returns(T::Array[Anthropic::Models::Messages::BatchCreateParams::Request]) }
        attr_accessor :requests

        sig do
          params(
            requests: T::Array[Anthropic::Models::Messages::BatchCreateParams::Request],
            request_options: Anthropic::RequestOpts
          ).void
        end
        def initialize(requests:, request_options: {}); end

        sig { returns(Anthropic::Models::Messages::BatchCreateParams::Shape) }
        def to_h; end

        class Request < Anthropic::BaseModel
          Shape = T.type_alias do
            {custom_id: String, params: Anthropic::Models::Messages::BatchCreateParams::Request::Params}
          end

          sig { returns(String) }
          attr_accessor :custom_id

          sig { returns(Anthropic::Models::Messages::BatchCreateParams::Request::Params) }
          attr_accessor :params

          sig do
            params(
              custom_id: String,
              params: Anthropic::Models::Messages::BatchCreateParams::Request::Params
            ).void
          end
          def initialize(custom_id:, params:); end

          sig { returns(Anthropic::Models::Messages::BatchCreateParams::Request::Shape) }
          def to_h; end

          class Params < Anthropic::BaseModel
            Shape = T.type_alias do
              {
                max_tokens: Integer,
                messages: T::Array[Anthropic::Models::MessageParam],
                model: Anthropic::Models::Model::Variants,
                metadata: Anthropic::Models::Metadata,
                stop_sequences: T::Array[String],
                stream: T::Boolean,
                system_: Anthropic::Models::Messages::BatchCreateParams::Request::Params::System::Variants,
                temperature: Float,
                tool_choice: Anthropic::Models::ToolChoice::Variants,
                tools: T::Array[Anthropic::Models::Tool],
                top_k: Integer,
                top_p: Float
              }
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

            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :stop_sequences

            sig { params(stop_sequences: T::Array[String]).void }
            attr_writer :stop_sequences

            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :stream

            sig { params(stream: T::Boolean).void }
            attr_writer :stream

            sig do
              returns(T.nilable(Anthropic::Models::Messages::BatchCreateParams::Request::Params::System::Variants))
            end
            attr_reader :system_

            sig do
              params(system_: Anthropic::Models::Messages::BatchCreateParams::Request::Params::System::Variants).void
            end
            attr_writer :system_

            sig { returns(T.nilable(Float)) }
            attr_reader :temperature

            sig { params(temperature: Float).void }
            attr_writer :temperature

            sig { returns(T.nilable(Anthropic::Models::ToolChoice::Variants)) }
            attr_reader :tool_choice

            sig { params(tool_choice: Anthropic::Models::ToolChoice::Variants).void }
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
                model: Anthropic::Models::Model::Variants,
                metadata: Anthropic::Models::Metadata,
                stop_sequences: T::Array[String],
                stream: T::Boolean,
                system_: Anthropic::Models::Messages::BatchCreateParams::Request::Params::System::Variants,
                temperature: Float,
                tool_choice: Anthropic::Models::ToolChoice::Variants,
                tools: T::Array[Anthropic::Models::Tool],
                top_k: Integer,
                top_p: Float
              ).void
            end
            def initialize(
              max_tokens:,
              messages:,
              model:,
              metadata: nil,
              stop_sequences: nil,
              stream: nil,
              system_: nil,
              temperature: nil,
              tool_choice: nil,
              tools: nil,
              top_k: nil,
              top_p: nil
            ); end

            sig { returns(Anthropic::Models::Messages::BatchCreateParams::Request::Params::Shape) }
            def to_h; end

            class System < Anthropic::Union
              abstract!

              Variants = T.type_alias { T.any(String, T::Array[Anthropic::Models::TextBlockParam]) }

              TextBlockParamArray = T.type_alias { T::Array[Anthropic::Models::TextBlockParam] }

              sig do
                override.returns(
                  [
                    [NilClass, String],
                    [NilClass, T::Array[Anthropic::Models::TextBlockParam]]
                  ]
                )
              end
              private_class_method def self.variants; end
            end
          end
        end
      end
    end
  end
end
