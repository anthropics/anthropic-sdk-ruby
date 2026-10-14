# frozen_string_literal: true

module Anthropic
  module Helpers
    module Tracing
      class << self
        # @param options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil] request options
        #
        # @return [String, nil]
        def conversation_id(options)
          Anthropic::Internal::Tracing.request_option(options.to_h[:open_telemetry])[:conversation_id]&.to_s
        end
      end
    end
  end
end
