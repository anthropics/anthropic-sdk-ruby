# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsFileRubric < Anthropic::Internal::Type::BaseModel
          # @!attribute file_id
          #   ID of the rubric file.
          #
          #   @return [String]
          required :file_id, String

          # @!attribute type
          #
          #   @return [Symbol, :file]
          required :type, const: :file

          # @!method initialize(file_id:, type: :file)
          #   Rubric referenced by a file uploaded via the Files API.
          #
          #   @param file_id [String] ID of the rubric file.
          #
          #   @param type [Symbol, :file]
        end
      end
    end
  end
end
