# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BatchCreateParams < Anthropic::BaseModel
          extend Anthropic::RequestParameters::Converter
          include Anthropic::RequestParameters

          sig { returns(T::Array[Anthropic::Models::Beta::Messages::BatchCreateParams::Request]) }
          attr_accessor :requests

          sig { returns(T.nilable(T::Array[T.any(String, Symbol)])) }
          attr_reader :betas

          sig { params(betas: T::Array[T.any(String, Symbol)]).void }
          attr_writer :betas

          sig do
            params(
              requests: T::Array[Anthropic::Models::Beta::Messages::BatchCreateParams::Request],
              betas: T::Array[T.any(String, Symbol)],
              request_options: T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything])
            ).void
          end
          def initialize(requests:, betas: nil, request_options: {})
          end

          sig do
            override.returns(
              {
                requests: T::Array[Anthropic::Models::Beta::Messages::BatchCreateParams::Request],
                betas: T::Array[T.any(String, Symbol)],
                request_options: Anthropic::RequestOptions
              }
            )
          end
          def to_hash
          end

          class Request < Anthropic::BaseModel
            sig { returns(String) }
            attr_accessor :custom_id

            sig { returns(Anthropic::Models::Beta::Messages::BatchCreateParams::Request::Params) }
            attr_accessor :params

            sig do
              params(
                custom_id: String,
                params: Anthropic::Models::Beta::Messages::BatchCreateParams::Request::Params
              ).void
            end
            def initialize(custom_id:, params:)
            end

            sig do
              override.returns(
                {
                  custom_id: String,
                  params: Anthropic::Models::Beta::Messages::BatchCreateParams::Request::Params
                }
              )
            end
            def to_hash
            end

            class Params < Anthropic::BaseModel
              sig { returns(Integer) }
              attr_accessor :max_tokens

              sig { returns(T::Array[Anthropic::Models::Beta::BetaMessageParam]) }
              attr_accessor :messages

              sig { returns(T.any(Symbol, String)) }
              attr_accessor :model

              sig { returns(T.nilable(Anthropic::Models::Beta::BetaMetadata)) }
              attr_reader :metadata

              sig { params(metadata: Anthropic::Models::Beta::BetaMetadata).void }
              attr_writer :metadata

              sig { returns(T.nilable(T::Array[String])) }
              attr_reader :stop_sequences

              sig { params(stop_sequences: T::Array[String]).void }
              attr_writer :stop_sequences

              sig { returns(T.nilable(T::Boolean)) }
              attr_reader :stream

              sig { params(stream: T::Boolean).void }
              attr_writer :stream

              sig { returns(T.nilable(T.any(String, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]))) }
              attr_reader :system_

              sig do
                params(system_: T.any(String, T::Array[Anthropic::Models::Beta::BetaTextBlockParam])).void
              end
              attr_writer :system_

              sig { returns(T.nilable(Float)) }
              attr_reader :temperature

              sig { params(temperature: Float).void }
              attr_writer :temperature

              sig do
                returns(
                  T.nilable(
                    T.any(
                      Anthropic::Models::Beta::BetaToolChoiceAuto,
                      Anthropic::Models::Beta::BetaToolChoiceAny,
                      Anthropic::Models::Beta::BetaToolChoiceTool
                    )
                  )
                )
              end
              attr_reader :tool_choice

              sig do
                params(
                  tool_choice: T.any(
                    Anthropic::Models::Beta::BetaToolChoiceAuto,
                    Anthropic::Models::Beta::BetaToolChoiceAny,
                    Anthropic::Models::Beta::BetaToolChoiceTool
                  )
                ).void
              end
              attr_writer :tool_choice

              sig do
                returns(
                  T.nilable(
                    T::Array[T.any(
                      Anthropic::Models::Beta::BetaTool,
                      Anthropic::Models::Beta::BetaToolComputerUse20241022,
                      Anthropic::Models::Beta::BetaToolBash20241022,
                      Anthropic::Models::Beta::BetaToolTextEditor20241022
                    )]
                  )
                )
              end
              attr_reader :tools

              sig do
                params(
                  tools: T::Array[T.any(
                    Anthropic::Models::Beta::BetaTool,
                    Anthropic::Models::Beta::BetaToolComputerUse20241022,
                    Anthropic::Models::Beta::BetaToolBash20241022,
                    Anthropic::Models::Beta::BetaToolTextEditor20241022
                  )]
                ).void
              end
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
                  messages: T::Array[Anthropic::Models::Beta::BetaMessageParam],
                  model: T.any(Symbol, String),
                  metadata: Anthropic::Models::Beta::BetaMetadata,
                  stop_sequences: T::Array[String],
                  stream: T::Boolean,
                  system_: T.any(String, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]),
                  temperature: Float,
                  tool_choice: T.any(
                    Anthropic::Models::Beta::BetaToolChoiceAuto,
                    Anthropic::Models::Beta::BetaToolChoiceAny,
                    Anthropic::Models::Beta::BetaToolChoiceTool
                  ),
                  tools: T::Array[T.any(
                    Anthropic::Models::Beta::BetaTool,
                    Anthropic::Models::Beta::BetaToolComputerUse20241022,
                    Anthropic::Models::Beta::BetaToolBash20241022,
                    Anthropic::Models::Beta::BetaToolTextEditor20241022
                  )],
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
                    messages: T::Array[Anthropic::Models::Beta::BetaMessageParam],
                    model: T.any(Symbol, String),
                    metadata: Anthropic::Models::Beta::BetaMetadata,
                    stop_sequences: T::Array[String],
                    stream: T::Boolean,
                    system_: T.any(String, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]),
                    temperature: Float,
                    tool_choice: T.any(
                      Anthropic::Models::Beta::BetaToolChoiceAuto,
                      Anthropic::Models::Beta::BetaToolChoiceAny,
                      Anthropic::Models::Beta::BetaToolChoiceTool
                    ),
                    tools: T::Array[T.any(
                      Anthropic::Models::Beta::BetaTool,
                      Anthropic::Models::Beta::BetaToolComputerUse20241022,
                      Anthropic::Models::Beta::BetaToolBash20241022,
                      Anthropic::Models::Beta::BetaToolTextEditor20241022
                    )],
                    top_k: Integer,
                    top_p: Float
                  }
                )
              end
              def to_hash
              end

              class System < Anthropic::Union
                abstract!

                BetaTextBlockParamArray = T.type_alias do
                  T::Array[Anthropic::Models::Beta::BetaTextBlockParam]
                end

                sig do
                  override.returns(
                    [
                      [NilClass, String],
                      [NilClass, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]]
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
end
