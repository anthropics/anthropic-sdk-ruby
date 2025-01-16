# frozen_string_literal: true

module Anthropic
  module Models
    # The model that will complete your prompt.\n\nSee [models](https://docs.anthropic.com/en/docs/models-overview) for additional details and options.
    #
    # @example
    # ```ruby
    # case model
    # in String
    #   # ...
    # in enum: Anthropic::Models::Model::UnionMember1
    #   # ...
    # end
    # ```
    class Model < Anthropic::Union
      variant String

      # The model that will complete your prompt.\n\nSee [models](https://docs.anthropic.com/en/docs/models-overview) for additional details and options.
      variant enum: -> { Anthropic::Models::Model::UnionMember1 }

      # The model that will complete your prompt.\n\nSee [models](https://docs.anthropic.com/en/docs/models-overview) for additional details and options.
      #
      # @example
      # ```ruby
      # case union_member1
      # in :"claude-3-5-haiku-latest"
      #   # ...
      # in :"claude-3-5-haiku-20241022"
      #   # ...
      # in :"claude-3-5-sonnet-latest"
      #   # ...
      # in :"claude-3-5-sonnet-20241022"
      #   # ...
      # in :"claude-3-5-sonnet-20240620"
      #   # ...
      # in ...
      #   #...
      # end
      # ```
      class UnionMember1 < Anthropic::Enum
        # Fast and cost-effective model
        CLAUDE_3_5_HAIKU_LATEST = :"claude-3-5-haiku-latest"

        # Fast and cost-effective model
        CLAUDE_3_5_HAIKU_20241022 = :"claude-3-5-haiku-20241022"

        # Our most intelligent model
        CLAUDE_3_5_SONNET_LATEST = :"claude-3-5-sonnet-latest"

        # Our most intelligent model
        CLAUDE_3_5_SONNET_20241022 = :"claude-3-5-sonnet-20241022"

        # Our previous most intelligent model
        CLAUDE_3_5_SONNET_20240620 = :"claude-3-5-sonnet-20240620"

        # Excels at writing and complex tasks
        CLAUDE_3_OPUS_LATEST = :"claude-3-opus-latest"

        # Excels at writing and complex tasks
        CLAUDE_3_OPUS_20240229 = :"claude-3-opus-20240229"

        # Balance of speed and intelligence
        CLAUDE_3_SONNET_20240229 = :"claude-3-sonnet-20240229"

        # Our previous fast and cost-effective
        CLAUDE_3_HAIKU_20240307 = :"claude-3-haiku-20240307"

        CLAUDE_2_1 = :"claude-2.1"

        CLAUDE_2_0 = :"claude-2.0"

        finalize!
      end
    end
  end
end
