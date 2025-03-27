# typed: strong

module Anthropic
  module Models
    module Messages
      class BatchCreateParams < Anthropic::BaseModel
        extend Anthropic::RequestParameters::Converter
        include Anthropic::RequestParameters

        # List of requests for prompt completion. Each is an individual request to create
        #   a Message.
        sig { returns(T::Array[Anthropic::Models::Messages::BatchCreateParams::Request]) }
        attr_accessor :requests

        sig do
          params(
            requests: T::Array[T.any(Anthropic::Models::Messages::BatchCreateParams::Request, Anthropic::Util::AnyHash)],
            request_options: T.any(Anthropic::RequestOptions, Anthropic::Util::AnyHash)
          )
            .returns(T.attached_class)
        end
        def self.new(requests:, request_options: {})
        end

        sig do
          override
            .returns(
              {
                requests: T::Array[Anthropic::Models::Messages::BatchCreateParams::Request],
                request_options: Anthropic::RequestOptions
              }
            )
        end
        def to_hash
        end

        class Request < Anthropic::BaseModel
          # Developer-provided ID created for each request in a Message Batch. Useful for
          #   matching results to requests, as results may be given out of request order.
          #
          #   Must be unique for each request within the Message Batch.
          sig { returns(String) }
          attr_accessor :custom_id

          # Messages API creation parameters for the individual request.
          #
          #   See the [Messages API reference](/en/api/messages) for full documentation on
          #   available parameters.
          sig { returns(Anthropic::Models::Messages::BatchCreateParams::Request::Params) }
          attr_reader :params

          sig do
            params(
              params: T.any(Anthropic::Models::Messages::BatchCreateParams::Request::Params, Anthropic::Util::AnyHash)
            )
              .void
          end
          attr_writer :params

          sig do
            params(
              custom_id: String,
              params: T.any(Anthropic::Models::Messages::BatchCreateParams::Request::Params, Anthropic::Util::AnyHash)
            )
              .returns(T.attached_class)
          end
          def self.new(custom_id:, params:)
          end

          sig do
            override
              .returns({custom_id: String, params: Anthropic::Models::Messages::BatchCreateParams::Request::Params})
          end
          def to_hash
          end

          class Params < Anthropic::BaseModel
            # The maximum number of tokens to generate before stopping.
            #
            #   Note that our models may stop _before_ reaching this maximum. This parameter
            #   only specifies the absolute maximum number of tokens to generate.
            #
            #   Different models have different maximum values for this parameter. See
            #   [models](https://docs.anthropic.com/en/docs/models-overview) for details.
            sig { returns(Integer) }
            attr_accessor :max_tokens

            # Input messages.
            #
            #   Our models are trained to operate on alternating `user` and `assistant`
            #   conversational turns. When creating a new `Message`, you specify the prior
            #   conversational turns with the `messages` parameter, and the model then generates
            #   the next `Message` in the conversation. Consecutive `user` or `assistant` turns
            #   in your request will be combined into a single turn.
            #
            #   Each input message must be an object with a `role` and `content`. You can
            #   specify a single `user`-role message, or you can include multiple `user` and
            #   `assistant` messages.
            #
            #   If the final message uses the `assistant` role, the response content will
            #   continue immediately from the content in that message. This can be used to
            #   constrain part of the model's response.
            #
            #   Example with a single `user` message:
            #
            #   ```json
            #   [{ "role": "user", "content": "Hello, Claude" }]
            #   ```
            #
            #   Example with multiple conversational turns:
            #
            #   ```json
            #   [
            #     { "role": "user", "content": "Hello there." },
            #     { "role": "assistant", "content": "Hi, I'm Claude. How can I help you?" },
            #     { "role": "user", "content": "Can you explain LLMs in plain English?" }
            #   ]
            #   ```
            #
            #   Example with a partially-filled response from Claude:
            #
            #   ```json
            #   [
            #     {
            #       "role": "user",
            #       "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
            #     },
            #     { "role": "assistant", "content": "The best answer is (" }
            #   ]
            #   ```
            #
            #   Each input message `content` may be either a single `string` or an array of
            #   content blocks, where each block has a specific `type`. Using a `string` for
            #   `content` is shorthand for an array of one content block of type `"text"`. The
            #   following input messages are equivalent:
            #
            #   ```json
            #   { "role": "user", "content": "Hello, Claude" }
            #   ```
            #
            #   ```json
            #   { "role": "user", "content": [{ "type": "text", "text": "Hello, Claude" }] }
            #   ```
            #
            #   Starting with Claude 3 models, you can also send image content blocks:
            #
            #   ```json
            #   {
            #     "role": "user",
            #     "content": [
            #       {
            #         "type": "image",
            #         "source": {
            #           "type": "base64",
            #           "media_type": "image/jpeg",
            #           "data": "/9j/4AAQSkZJRg..."
            #         }
            #       },
            #       { "type": "text", "text": "What is in this image?" }
            #     ]
            #   }
            #   ```
            #
            #   We currently support the `base64` source type for images, and the `image/jpeg`,
            #   `image/png`, `image/gif`, and `image/webp` media types.
            #
            #   See [examples](https://docs.anthropic.com/en/api/messages-examples#vision) for
            #   more input examples.
            #
            #   Note that if you want to include a
            #   [system prompt](https://docs.anthropic.com/en/docs/system-prompts), you can use
            #   the top-level `system` parameter — there is no `"system"` role for input
            #   messages in the Messages API.
            sig { returns(T::Array[Anthropic::Models::MessageParam]) }
            attr_accessor :messages

            # The model that will complete your prompt.\n\nSee
            #   [models](https://docs.anthropic.com/en/docs/models-overview) for additional
            #   details and options.
            sig { returns(T.any(Anthropic::Models::Model::OrSymbol, String)) }
            attr_accessor :model

            # An object describing metadata about the request.
            sig { returns(T.nilable(Anthropic::Models::Metadata)) }
            attr_reader :metadata

            sig { params(metadata: T.any(Anthropic::Models::Metadata, Anthropic::Util::AnyHash)).void }
            attr_writer :metadata

            # Custom text sequences that will cause the model to stop generating.
            #
            #   Our models will normally stop when they have naturally completed their turn,
            #   which will result in a response `stop_reason` of `"end_turn"`.
            #
            #   If you want the model to stop generating when it encounters custom strings of
            #   text, you can use the `stop_sequences` parameter. If the model encounters one of
            #   the custom sequences, the response `stop_reason` value will be `"stop_sequence"`
            #   and the response `stop_sequence` value will contain the matched stop sequence.
            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :stop_sequences

            sig { params(stop_sequences: T::Array[String]).void }
            attr_writer :stop_sequences

            # Whether to incrementally stream the response using server-sent events.
            #
            #   See [streaming](https://docs.anthropic.com/en/api/messages-streaming) for
            #   details.
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :stream

            sig { params(stream: T::Boolean).void }
            attr_writer :stream

            # System prompt.
            #
            #   A system prompt is a way of providing context and instructions to Claude, such
            #   as specifying a particular goal or role. See our
            #   [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
            sig { returns(T.nilable(T.any(String, T::Array[Anthropic::Models::TextBlockParam]))) }
            attr_reader :system_

            sig do
              params(
                system_: T.any(String, T::Array[T.any(Anthropic::Models::TextBlockParam, Anthropic::Util::AnyHash)])
              )
                .void
            end
            attr_writer :system_

            # Amount of randomness injected into the response.
            #
            #   Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
            #   for analytical / multiple choice, and closer to `1.0` for creative and
            #   generative tasks.
            #
            #   Note that even with `temperature` of `0.0`, the results will not be fully
            #   deterministic.
            sig { returns(T.nilable(Float)) }
            attr_reader :temperature

            sig { params(temperature: Float).void }
            attr_writer :temperature

            # Configuration for enabling Claude's extended thinking.
            #
            #   When enabled, responses include `thinking` content blocks showing Claude's
            #   thinking process before the final answer. Requires a minimum budget of 1,024
            #   tokens and counts towards your `max_tokens` limit.
            #
            #   See
            #   [extended thinking](https://docs.anthropic.com/en/docs/build-with-claude/extended-thinking)
            #   for details.
            sig do
              returns(
                T.nilable(T.any(Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled))
              )
            end
            attr_reader :thinking

            sig do
              params(
                thinking: T.any(
                  Anthropic::Models::ThinkingConfigEnabled,
                  Anthropic::Util::AnyHash,
                  Anthropic::Models::ThinkingConfigDisabled
                )
              )
                .void
            end
            attr_writer :thinking

            # How the model should use the provided tools. The model can use a specific tool,
            #   any available tool, decide by itself, or not use tools at all.
            sig do
              returns(
                T.nilable(
                  T.any(
                    Anthropic::Models::ToolChoiceAuto,
                    Anthropic::Models::ToolChoiceAny,
                    Anthropic::Models::ToolChoiceTool,
                    Anthropic::Models::ToolChoiceNone
                  )
                )
              )
            end
            attr_reader :tool_choice

            sig do
              params(
                tool_choice: T.any(
                  Anthropic::Models::ToolChoiceAuto,
                  Anthropic::Util::AnyHash,
                  Anthropic::Models::ToolChoiceAny,
                  Anthropic::Models::ToolChoiceTool,
                  Anthropic::Models::ToolChoiceNone
                )
              )
                .void
            end
            attr_writer :tool_choice

            # Definitions of tools that the model may use.
            #
            #   If you include `tools` in your API request, the model may return `tool_use`
            #   content blocks that represent the model's use of those tools. You can then run
            #   those tools using the tool input generated by the model and then optionally
            #   return results back to the model using `tool_result` content blocks.
            #
            #   Each tool definition includes:
            #
            #   - `name`: Name of the tool.
            #   - `description`: Optional, but strongly-recommended description of the tool.
            #   - `input_schema`: [JSON schema](https://json-schema.org/draft/2020-12) for the
            #     tool `input` shape that the model will produce in `tool_use` output content
            #     blocks.
            #
            #   For example, if you defined `tools` as:
            #
            #   ```json
            #   [
            #     {
            #       "name": "get_stock_price",
            #       "description": "Get the current stock price for a given ticker symbol.",
            #       "input_schema": {
            #         "type": "object",
            #         "properties": {
            #           "ticker": {
            #             "type": "string",
            #             "description": "The stock ticker symbol, e.g. AAPL for Apple Inc."
            #           }
            #         },
            #         "required": ["ticker"]
            #       }
            #     }
            #   ]
            #   ```
            #
            #   And then asked the model "What's the S&P 500 at today?", the model might produce
            #   `tool_use` content blocks in the response like this:
            #
            #   ```json
            #   [
            #     {
            #       "type": "tool_use",
            #       "id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
            #       "name": "get_stock_price",
            #       "input": { "ticker": "^GSPC" }
            #     }
            #   ]
            #   ```
            #
            #   You might then run your `get_stock_price` tool with `{"ticker": "^GSPC"}` as an
            #   input, and return the following back to the model in a subsequent `user`
            #   message:
            #
            #   ```json
            #   [
            #     {
            #       "type": "tool_result",
            #       "tool_use_id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
            #       "content": "259.75 USD"
            #     }
            #   ]
            #   ```
            #
            #   Tools can be used for workflows that include running client-side tools and
            #   functions, or more generally whenever you want the model to produce a particular
            #   JSON structure of output.
            #
            #   See our [guide](https://docs.anthropic.com/en/docs/tool-use) for more details.
            sig do
              returns(
                T.nilable(
                  T::Array[
                  T.any(
                    Anthropic::Models::Tool,
                    Anthropic::Models::ToolBash20250124,
                    Anthropic::Models::ToolTextEditor20250124
                  )
                  ]
                )
              )
            end
            attr_reader :tools

            sig do
              params(
                tools: T::Array[
                T.any(
                  Anthropic::Models::Tool,
                  Anthropic::Util::AnyHash,
                  Anthropic::Models::ToolBash20250124,
                  Anthropic::Models::ToolTextEditor20250124
                )
                ]
              )
                .void
            end
            attr_writer :tools

            # Only sample from the top K options for each subsequent token.
            #
            #   Used to remove "long tail" low probability responses.
            #   [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
            #
            #   Recommended for advanced use cases only. You usually only need to use
            #   `temperature`.
            sig { returns(T.nilable(Integer)) }
            attr_reader :top_k

            sig { params(top_k: Integer).void }
            attr_writer :top_k

            # Use nucleus sampling.
            #
            #   In nucleus sampling, we compute the cumulative distribution over all the options
            #   for each subsequent token in decreasing probability order and cut it off once it
            #   reaches a particular probability specified by `top_p`. You should either alter
            #   `temperature` or `top_p`, but not both.
            #
            #   Recommended for advanced use cases only. You usually only need to use
            #   `temperature`.
            sig { returns(T.nilable(Float)) }
            attr_reader :top_p

            sig { params(top_p: Float).void }
            attr_writer :top_p

            # Messages API creation parameters for the individual request.
            #
            #   See the [Messages API reference](/en/api/messages) for full documentation on
            #   available parameters.
            sig do
              params(
                max_tokens: Integer,
                messages: T::Array[T.any(Anthropic::Models::MessageParam, Anthropic::Util::AnyHash)],
                model: T.any(Anthropic::Models::Model::OrSymbol, String),
                metadata: T.any(Anthropic::Models::Metadata, Anthropic::Util::AnyHash),
                stop_sequences: T::Array[String],
                stream: T::Boolean,
                system_: T.any(String, T::Array[T.any(Anthropic::Models::TextBlockParam, Anthropic::Util::AnyHash)]),
                temperature: Float,
                thinking: T.any(
                  Anthropic::Models::ThinkingConfigEnabled,
                  Anthropic::Util::AnyHash,
                  Anthropic::Models::ThinkingConfigDisabled
                ),
                tool_choice: T.any(
                  Anthropic::Models::ToolChoiceAuto,
                  Anthropic::Util::AnyHash,
                  Anthropic::Models::ToolChoiceAny,
                  Anthropic::Models::ToolChoiceTool,
                  Anthropic::Models::ToolChoiceNone
                ),
                tools: T::Array[
                T.any(
                  Anthropic::Models::Tool,
                  Anthropic::Util::AnyHash,
                  Anthropic::Models::ToolBash20250124,
                  Anthropic::Models::ToolTextEditor20250124
                )
                ],
                top_k: Integer,
                top_p: Float
              )
                .returns(T.attached_class)
            end
            def self.new(
              max_tokens:,
              messages:,
              model:,
              metadata: nil,
              stop_sequences: nil,
              stream: nil,
              system_: nil,
              temperature: nil,
              thinking: nil,
              tool_choice: nil,
              tools: nil,
              top_k: nil,
              top_p: nil
            )
            end

            sig do
              override
                .returns(
                  {
                    max_tokens: Integer,
                    messages: T::Array[Anthropic::Models::MessageParam],
                    model: T.any(Anthropic::Models::Model::OrSymbol, String),
                    metadata: Anthropic::Models::Metadata,
                    stop_sequences: T::Array[String],
                    stream: T::Boolean,
                    system_: T.any(String, T::Array[Anthropic::Models::TextBlockParam]),
                    temperature: Float,
                    thinking: T.any(Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled),
                    tool_choice: T.any(
                      Anthropic::Models::ToolChoiceAuto,
                      Anthropic::Models::ToolChoiceAny,
                      Anthropic::Models::ToolChoiceTool,
                      Anthropic::Models::ToolChoiceNone
                    ),
                    tools: T::Array[
                    T.any(
                      Anthropic::Models::Tool,
                      Anthropic::Models::ToolBash20250124,
                      Anthropic::Models::ToolTextEditor20250124
                    )
                    ],
                    top_k: Integer,
                    top_p: Float
                  }
                )
            end
            def to_hash
            end

            # System prompt.
            #
            #   A system prompt is a way of providing context and instructions to Claude, such
            #   as specifying a particular goal or role. See our
            #   [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
            module System
              extend Anthropic::Union

              sig { override.returns([String, T::Array[Anthropic::Models::TextBlockParam]]) }
              def self.variants
              end

              TextBlockParamArray = T.let(Anthropic::ArrayOf[Anthropic::Models::TextBlockParam], Anthropic::Converter)
            end
          end
        end
      end
    end
  end
end
