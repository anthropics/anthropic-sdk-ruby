# typed: strong

module Anthropic
  module Models
    class Model < Anthropic::Union
      abstract!

      class UnionMember0 < Anthropic::Enum
        abstract!

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

        sig { override.returns(T::Array[Symbol]) }
        def self.values
        end
      end

      sig { override.returns([[NilClass, Symbol], [NilClass, String]]) }
      private_class_method def self.variants
      end
    end
  end
end
