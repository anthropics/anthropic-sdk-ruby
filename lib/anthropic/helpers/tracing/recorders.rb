# frozen_string_literal: true

module Anthropic
  module Helpers
    module Tracing
      class << self
        # A tool runner's params are the application's own, so the format can still be a model, or a
        # model class that the structured output helper sends as a `json_schema` format.
        #
        # @param params [Hash{Symbol=>Object}]
        #
        # @return [Boolean]
        def json_output_format?(params)
          case params[:output_format] || params[:output_config]&.[](:format)
          in nil
            false
          in Anthropic::JSONOutputFormat | Anthropic::Beta::BetaJSONOutputFormat |
             Anthropic::Helpers::InputSchema::JsonSchemaConverter |
             {schema: Anthropic::Helpers::InputSchema::JsonSchemaConverter}
            true
          in format
            symbolize_keys(format)[:type].to_s == "json_schema"
          end
        end
      end

      # What `Anthropic::Internal::Tracing.register_recorder` takes: `start_attributes` and `record`.
      module Recorders
        # A request to a Session thread without a conversation ID takes the thread's ID, so that the
        # span groups with the API's spans for that thread.
        module APICall
          class << self
            # @param _client [Anthropic::Client]
            # @param req [Hash{Symbol=>Object}]
            #
            # @return [Hash{String=>Object}]
            def start_attributes(_client, req)
              thread_id = req[:span_attributes].to_h[ANTHROPIC_SESSION_THREAD_ID]
              {GEN_AI_CONVERSATION_ID => Tracing.conversation_id(req[:options]) || thread_id}
            end

            # @param _span [OpenTelemetry::Trace::Span]
            # @param _result [Hash{Symbol=>Object}]
            def record(_span, _result) = nil
          end
        end

        module MessagesCreate
          class << self
            # @param _client [Anthropic::Client]
            # @param req [Hash{Symbol=>Object}]
            #
            # @return [Hash{String=>Object}]
            def start_attributes(_client, req)
              json = Tracing.json_output_format?(req[:body])
              {GEN_AI_OUTPUT_TYPE => (GEN_AI_OUTPUT_TYPE_VALUE_JSON if json)}
            end

            # @param span [OpenTelemetry::Trace::Span]
            # @param result [Hash{Symbol=>Object}]
            def record(span, result)
              data = result[:data]
              params = result[:req][:body]
              content = result[:client].open_telemetry_content?
              limit = result[:client].open_telemetry_max_content_bytes
              streamed = data.is_a?(Anthropic::Internal::Type::BaseStream)
              message = data if data.is_a?(Anthropic::Internal::Type::BaseModel)
              Tracing.set_computed_usage_attributes(span, message[:usage]) unless message.nil?
              # A request whose content cannot be recorded still has its stream followed.
              if content
                Tracing.recording("the API call") do
                  Tracing.set_message_content_attributes(span, params, message&.[](:content), limit: limit)
                end
              end
              return unless streamed

              result[:iterator], result[:streamed_message] = Tracing.follow_streamed_message(
                span,
                result[:iterator],
                params: params,
                start_time: result[:start_time],
                content: content,
                content_limit: limit
              )
            end
          end
        end

        module BatchesCreate
          class << self
            # @param _client [Anthropic::Client]
            # @param req [Hash{Symbol=>Object}]
            #
            # @return [Hash{String=>Object}]
            def start_attributes(_client, req)
              {ANTHROPIC_MESSAGE_BATCH_REQUEST_COUNT => req[:body][:requests]&.length}
            end

            # @param _span [OpenTelemetry::Trace::Span]
            # @param _result [Hash{Symbol=>Object}]
            def record(_span, _result) = nil
          end
        end

        module SessionsCreate
          class << self
            # @param _client [Anthropic::Client]
            # @param req [Hash{Symbol=>Object}]
            #
            # @return [Hash{String=>Object}]
            def start_attributes(_client, req)
              agent = Tracing.symbolize_keys(req[:body][:agent])
              {GEN_AI_AGENT_ID => agent.is_a?(Hash) ? agent[:id] : agent}
            end

            # @param _span [OpenTelemetry::Trace::Span]
            # @param _result [Hash{Symbol=>Object}]
            def record(_span, _result) = nil
          end
        end
      end

      Anthropic::Internal::Tracing.register_recorder(nil, Recorders::APICall)
      {
        Anthropic::Internal::Tracing::SpanName::MESSAGES_CREATE => Recorders::MessagesCreate,
        Anthropic::Internal::Tracing::SpanName::MESSAGES_BATCHES_CREATE => Recorders::BatchesCreate,
        Anthropic::Internal::Tracing::SpanName::SESSIONS_CREATE => Recorders::SessionsCreate
      }.each { |span_name, recorder| Anthropic::Internal::Tracing.register_recorder(span_name, recorder) }
    end
  end
end
