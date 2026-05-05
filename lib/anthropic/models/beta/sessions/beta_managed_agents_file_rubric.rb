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
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileRubric::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsFileRubric::Type }

          # @!method initialize(file_id:, type:)
          #   Rubric referenced by a file uploaded via the Files API.
          #
          #   @param file_id [String] ID of the rubric file.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileRubric::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileRubric#type
          module Type
            extend Anthropic::Internal::Type::Enum

            FILE = :file

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
