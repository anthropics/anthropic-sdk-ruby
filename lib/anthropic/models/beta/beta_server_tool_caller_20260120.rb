# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaServerToolCaller20260120 < Anthropic::Internal::Type::BaseModel
        # @!attribute tool_id
        #
        #   @return [String]
        required :tool_id, String

        # @!attribute type
        #
        #   @return [Symbol, :code_execution_20260120]
        required :type, const: :code_execution_20260120

        # @!method initialize(tool_id:, type: :code_execution_20260120)
        #   @param tool_id [String]
        #   @param type [Symbol, :code_execution_20260120]
      end
    end

    BetaServerToolCaller20260120 = Beta::BetaServerToolCaller20260120
  end
end
