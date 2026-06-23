# typed: strong

module Anthropic
  module Helpers
    module StainlessHelperHeader
      HEADER = T.let("x-stainless-helper", String)

      BETA_TOOL_RUNNER = T.let("BetaToolRunner", String)

      class << self
        sig { params(headers: T::Hash[T.any(String, Symbol), T.untyped], value: String).returns(String) }
        def merged_value(headers, value)
        end
      end
    end
  end
end
