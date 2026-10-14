# frozen_string_literal: true

module Anthropic
  module Helpers
    module Tracing
      GEN_AI_CONVERSATION_ID = "gen_ai.conversation.id"
      GEN_AI_INPUT_MESSAGES = "gen_ai.input.messages"
      GEN_AI_OUTPUT_MESSAGES = "gen_ai.output.messages"
      GEN_AI_OUTPUT_TYPE = "gen_ai.output.type"
      GEN_AI_REQUEST_STOP_SEQUENCES = "gen_ai.request.stop_sequences"
      GEN_AI_RESPONSE_TIME_TO_FIRST_CHUNK = "gen_ai.response.time_to_first_chunk"
      GEN_AI_SYSTEM_INSTRUCTIONS = "gen_ai.system_instructions"
      GEN_AI_TOOL_CALL_ARGUMENTS = "gen_ai.tool.call.arguments"
      GEN_AI_TOOL_CALL_ID = "gen_ai.tool.call.id"
      GEN_AI_TOOL_DESCRIPTION = "gen_ai.tool.description"
      GEN_AI_TOOL_NAME = "gen_ai.tool.name"
      GEN_AI_TOOL_TYPE = "gen_ai.tool.type"
      GEN_AI_USAGE_INPUT_TOKENS = "gen_ai.usage.input_tokens"
      GEN_AI_OPERATION_NAME_VALUE_EXECUTE_TOOL = "execute_tool"
      GEN_AI_OPERATION_NAME_VALUE_INVOKE_AGENT = "invoke_agent"
      GEN_AI_TOOL_TYPE_VALUE_FUNCTION = "function"
      GEN_AI_OUTPUT_TYPE_VALUE_JSON = "json"

      ANTHROPIC_CONTENT_TRUNCATED = "anthropic.content.truncated"
      ANTHROPIC_MESSAGE_BATCH_REQUEST_COUNT = "anthropic.message.batch.request_count"
      ANTHROPIC_SESSION_THREAD_ID = "anthropic.session.thread.id"
      ANTHROPIC_TOOLSET_NAME = "anthropic.toolset.name"
      ANTHROPIC_TOOL_RESULT_CONTENT = "anthropic.tool_result.content"
      ANTHROPIC_USAGE_COMPACTION_INPUT_TOKENS = "anthropic.usage.compaction.input_tokens"
      ANTHROPIC_USAGE_COMPACTION_OUTPUT_TOKENS = "anthropic.usage.compaction.output_tokens"
      GEN_AI_AGENT_ID = "gen_ai.agent.id"
    end
  end
end
