# frozen_string_literal: true

module Anthropic
  module Helpers
    module Tools
      # Default summary prompt used when compacting conversation history
      DEFAULT_SUMMARY_PROMPT = <<~PROMPT.strip
        You have been working on the task described above but have not yet completed it. Write a continuation summary that will allow you (or another instance of yourself) to resume work efficiently in a future context window where the conversation history will be replaced with this summary. Your summary should be structured, concise, and actionable. Include:
        1. Task Overview
        The user's core request and success criteria
        Any clarifications or constraints they specified
        2. Current State
        What has been completed so far
        Files created, modified, or analyzed (with paths if relevant)
        Key outputs or artifacts produced
        3. Important Discoveries
        Technical constraints or requirements uncovered
        Decisions made and their rationale
        Errors encountered and how they were resolved
        What approaches were tried that didn't work (and why)
        4. Next Steps
        Specific actions needed to complete the task
        Any blockers or open questions to resolve
        Priority order if multiple steps remain
        5. Context to Preserve
        User preferences or style requirements
        Domain-specific details that aren't obvious
        Any promises made to the user
        Be concise but complete—err on the side of including information that would prevent duplicate work or repeated mistakes. Write in a way that enables immediate resumption of the task.
        Wrap your summary in <summary></summary> tags.
      PROMPT

      # Default token threshold for triggering compaction (100,000 tokens)
      DEFAULT_THRESHOLD = 100_000

      # Configuration for automatic conversation history compaction in tool runners.
      #
      # When the cumulative token count (input + output) across all messages exceeds
      # the threshold, the message history will be automatically summarized and compressed.
      #
      # By default, a warning is printed to STDERR the first time compaction occurs for
      # each runner instance. To silence the warning, provide an `on_compact` callback -
      # when present, the warning is suppressed and you handle compaction events your way.
      #
      # @example Basic usage with defaults
      #   client.beta.messages.tool_runner(
      #     model: "claude-sonnet-4-20250514",
      #     max_tokens: 4000,
      #     tools: [my_tool],
      #     messages: [...],
      #     compaction_control: { enabled: true }
      #   )
      #   # => Prints: "[anthropic-ruby] Context compaction triggered (N tokens)..."
      #
      # @example Custom threshold and callback
      #   client.beta.messages.tool_runner(
      #     # ... other params ...
      #     compaction_control: {
      #       enabled: true,
      #       context_token_threshold: 50_000,
      #       on_compact: ->(tokens_before, tokens_after) do
      #         logger.info "Compacted conversation: #{tokens_before} → #{tokens_after} tokens"
      #       end
      #     }
      #   )
      #   # => No warning printed; callback handles it
      #
      # @example Custom model and summary prompt
      #   client.beta.messages.tool_runner(
      #     # ... other params ...
      #     compaction_control: {
      #       enabled: true,
      #       model: "claude-3-7-sonnet-20250219",
      #       summary_prompt: "Summarize the conversation concisely..."
      #     }
      #   )
      #
      # @!attribute enabled
      #   @return [Boolean] Whether to enable automatic compaction. Required.
      #
      # @!attribute context_token_threshold
      #   @return [Integer, nil] The cumulative token count threshold at which to trigger
      #     compaction. When the total of input tokens (including cache tokens) and output
      #     tokens exceeds this value, compaction will occur. Defaults to 100,000 tokens.
      #
      # @!attribute model
      #   @return [String, Symbol, nil] The model to use for generating the compaction summary.
      #     If not specified, defaults to the same model used for the tool runner.
      #
      # @!attribute summary_prompt
      #   @return [String, nil] The prompt used to instruct the model on how to generate
      #     the summary. If not specified, uses {DEFAULT_SUMMARY_PROMPT}.
      #
      # @!attribute on_compact
      #   @return [Proc, nil] Optional callback invoked when compaction occurs.
      #     Receives two arguments: tokens_before (Integer) and tokens_after (Integer).
      #     Use this to log, monitor, or track compaction events. When provided, the
      #     default warning to STDERR is suppressed (you're handling it yourself).
      #
      # @see DEFAULT_SUMMARY_PROMPT
      # @see DEFAULT_THRESHOLD
      module CompactionControl; end
    end
  end
end
