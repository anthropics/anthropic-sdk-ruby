# typed: strong

module Anthropic
  module Models
    # The model that will complete your prompt.\n\nSee
    #   [models](https://docs.anthropic.com/en/docs/models-overview) for additional
    #   details and options.
    class Model < Anthropic::Union
      abstract!

      Variants = type_template(:out) { {fixed: T.any(Symbol, String)} }
    end
  end
end
