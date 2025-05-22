# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCodeExecutionOutputBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute file_id
        #
        #   @return [String]
        required :file_id, String

        # @!attribute type
        #
        #   @return [Symbol, :code_execution_output]
        required :type, const: :code_execution_output

        # @!method initialize(file_id:, type: :code_execution_output)
        #   @param file_id [String]
        #   @param type [Symbol, :code_execution_output]
      end
    end

    BetaCodeExecutionOutputBlock = Beta::BetaCodeExecutionOutputBlock
  end
end
