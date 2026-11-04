# frozen_string_literal: true

module Anthropic
  module Models
    class ClaudeCodeKeyCreatorNotMemberErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :claude_code_key_creator_not_member]
      required :error_code, const: :claude_code_key_creator_not_member

      # @!method initialize(error_code: :claude_code_key_creator_not_member)
      #   The API key belongs to the Claude Code workspace, and the user who created it is
      #   no longer a member of the organization or of that workspace.
      #
      #   @param error_code [Symbol, :claude_code_key_creator_not_member]
    end
  end
end
