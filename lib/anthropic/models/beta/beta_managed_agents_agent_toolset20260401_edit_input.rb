# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAgentToolset20260401EditInput < Anthropic::Internal::Type::BaseModel
        # @!attribute file_path
        #   Path of the file to edit.
        #
        #   @return [String]
        required :file_path, String

        # @!attribute new_string
        #   Replacement text.
        #
        #   @return [String]
        required :new_string, String

        # @!attribute old_string
        #   Substring to find and replace.
        #
        #   @return [String]
        required :old_string, String

        # @!attribute replace_all
        #   When true, replace every occurrence of `old_string` instead of requiring a
        #   unique match.
        #
        #   @return [Boolean, nil]
        optional :replace_all, Anthropic::Internal::Type::Boolean

        # @!method initialize(file_path:, new_string:, old_string:, replace_all: nil)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401EditInput} for
        #   more details.
        #
        #   Input payload for the `edit` tool. Performs a string replacement in the named
        #   file; by default `old_string` must occur exactly once.
        #
        #   @param file_path [String] Path of the file to edit.
        #
        #   @param new_string [String] Replacement text.
        #
        #   @param old_string [String] Substring to find and replace.
        #
        #   @param replace_all [Boolean] When true, replace every occurrence of `old_string`
      end
    end

    BetaManagedAgentsAgentToolset20260401EditInput = Beta::BetaManagedAgentsAgentToolset20260401EditInput
  end
end
