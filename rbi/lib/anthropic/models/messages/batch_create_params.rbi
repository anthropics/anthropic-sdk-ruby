# typed: strong

module Anthropic
  module Models
    module Messages
      class BatchCreateParams < Anthropic::BaseModel
        extend Anthropic::RequestParameters::Converter
        include Anthropic::RequestParameters

        sig { returns(T::Array[Anthropic::Models::Messages::BatchCreateParams::Request]) }
        def requests
        end

        sig do
          params(_: T::Array[Anthropic::Models::Messages::BatchCreateParams::Request]).returns(T::Array[Anthropic::Models::Messages::BatchCreateParams::Request])
        end
        def requests=(_)
        end

        sig do
          params(
            requests: T::Array[Anthropic::Models::Messages::BatchCreateParams::Request],
            request_options: T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything])
          ).void
        end
        def initialize(requests:, request_options: {})
        end

        sig do
          override.returns(
            {
              requests: T::Array[Anthropic::Models::Messages::BatchCreateParams::Request],
              request_options: Anthropic::RequestOptions
            }
          )
        end
        def to_hash
        end

        class Request < Anthropic::BaseModel
          sig { returns(String) }
          def custom_id
          end

          sig { params(_: String).returns(String) }
          def custom_id=(_)
          end

          sig { returns(Anthropic::Models::Messages::BatchCreateParams::Request::Params) }
          def params
          end

          sig do
            params(_: Anthropic::Models::Messages::BatchCreateParams::Request::Params).returns(Anthropic::Models::Messages::BatchCreateParams::Request::Params)
          end
          def params=(_)
          end

          sig do
            params(
              custom_id: String,
              params: Anthropic::Models::Messages::BatchCreateParams::Request::Params
            ).void
          end
          def initialize(custom_id:, params:)
          end

          sig do
            override.returns(
              {
                custom_id: String,
                params: Anthropic::Models::Messages::BatchCreateParams::Request::Params
              }
            )
          end
          def to_hash
          end

          class Params < Anthropic::BaseModel
            sig { returns(Integer) }
            def max_tokens
            end

            sig { params(_: Integer).returns(Integer) }
            def max_tokens=(_)
            end

            sig { returns(T::Array[Anthropic::Models::MessageParam]) }
            def messages
            end

            sig do
              params(_: T::Array[Anthropic::Models::MessageParam]).returns(T::Array[Anthropic::Models::MessageParam])
            end
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

            sig { returns(T.nilable(T::Boolean)) }
            def stream
            end

            sig { params(_: T::Boolean).returns(T::Boolean) }
            def stream=(_)
            end

            sig { returns(T.nilable(T.any(String, T::Array[Anthropic::Models::TextBlockParam]))) }
            def system_
            end

            sig do
              params(
                _: T.any(
                  String,
                  T::Array[Anthropic::Models::TextBlockParam]
                )
              ).returns(T.any(
                          String,
                          T::Array[Anthropic::Models::TextBlockParam]
                        ))
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
              ).returns(T.any(
                          Anthropic::Models::ToolChoiceAuto,
                          Anthropic::Models::ToolChoiceAny,
                          Anthropic::Models::ToolChoiceTool
                        ))
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
            )
            end

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
                  top_p: Float
                }
              )
            end
            def to_hash
            end

            class System < Anthropic::Union
              abstract!

              TextBlockParamArray = T.type_alias { T::Array[Anthropic::Models::TextBlockParam] }

              sig do
                override.returns(
                  [
                    [NilClass, String],
                    [NilClass, T::Array[Anthropic::Models::TextBlockParam]]
                  ]
                )
              end
              private_class_method def self.variants
              end
            end
          end
        end
      end
    end
  end
end
