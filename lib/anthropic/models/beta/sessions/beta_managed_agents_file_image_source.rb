# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsFileImageSource < Anthropic::Internal::Type::BaseModel
          # @!attribute file_id
          #   ID of a previously uploaded file.
          #
          #   @return [String]
          required :file_id, String

          # @!attribute type
          #
          #   @return [Symbol, :file]
          required :type, const: :file

          # @!method initialize(file_id:, type: :file)
          #   Image referenced by file ID.
          #
          #   @param file_id [String] ID of a previously uploaded file.
          #
          #   @param type [Symbol, :file]
        end
      end
    end
  end
end
