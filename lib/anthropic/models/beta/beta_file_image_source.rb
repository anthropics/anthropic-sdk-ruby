# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaFileImageSource < Anthropic::Internal::Type::BaseModel
        # @!attribute file_id
        #
        #   @return [String]
        required :file_id, String

        # @!attribute type
        #
        #   @return [Symbol, :file]
        required :type, const: :file

        # @!method initialize(file_id:, type: :file)
        #   @param file_id [String]
        #   @param type [Symbol, :file]
      end
    end

    BetaFileImageSource = Beta::BetaFileImageSource
  end
end
