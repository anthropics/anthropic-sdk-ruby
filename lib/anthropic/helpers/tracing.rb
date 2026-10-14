# frozen_string_literal: true

module Anthropic
  module Helpers
    # @api private
    #
    # The span attributes that {Anthropic::Internal::Tracing} cannot take from its tables: the
    # computed ones, the Message that a stream carries, and the content of requests and responses.
    # The tool runner's two `INTERNAL` spans start and end here too.
    module Tracing
    end
  end
end
