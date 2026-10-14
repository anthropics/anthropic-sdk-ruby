# frozen_string_literal: true

module Anthropic
  module Helpers
    module Tracing
      class << self
        # @param span [OpenTelemetry::Trace::Span]
        # @param usage [Anthropic::Internal::Type::BaseModel, Hash{Symbol=>Object}, nil]
        def set_computed_usage_attributes(span, usage)
          return if usage.nil?

          unless usage[:input_tokens].nil?
            # The API's `input_tokens` leaves out the cached tokens, which the attribute counts.
            cached = usage[:cache_creation_input_tokens].to_i + usage[:cache_read_input_tokens].to_i
            span.set_attribute(GEN_AI_USAGE_INPUT_TOKENS, usage[:input_tokens] + cached)
          end
          compactions = usage[:iterations].to_a.select { _1[:type].to_sym == :compaction }
          return if compactions.empty?

          input_tokens = compactions.sum do
            _1[:input_tokens] + _1[:cache_creation_input_tokens] + _1[:cache_read_input_tokens]
          end
          span.set_attribute(ANTHROPIC_USAGE_COMPACTION_INPUT_TOKENS, input_tokens)
          span.set_attribute(ANTHROPIC_USAGE_COMPACTION_OUTPUT_TOKENS, compactions.sum { _1[:output_tokens] })
        end
      end
    end
  end
end
