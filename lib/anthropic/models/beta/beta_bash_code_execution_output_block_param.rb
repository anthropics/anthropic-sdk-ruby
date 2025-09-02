# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBashCodeExecutionOutputBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute file_id
        #
        #   @return [String]
        required :file_id, String

        # @!attribute type
        #
        #   @return [Symbol, :bash_code_execution_output]
        required :type, const: :bash_code_execution_output

        # @!method initialize(file_id:, type: :bash_code_execution_output)
        #   @param file_id [String]
        #   @param type [Symbol, :bash_code_execution_output]
      end
    end

    BetaBashCodeExecutionOutputBlockParam = Beta::BetaBashCodeExecutionOutputBlockParam
  end
end
