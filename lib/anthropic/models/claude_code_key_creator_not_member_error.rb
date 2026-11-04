# frozen_string_literal: true

module Anthropic
  module Models
    # The API key belongs to the Claude Code workspace, and the user who created it is
    # no longer a member of the organization or of that workspace.
    class ClaudeCodeKeyCreatorNotMemberError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :claude_code_key_creator_not_member]

      # @return [Anthropic::Models::ClaudeCodeKeyCreatorNotMemberErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::ClaudeCodeKeyCreatorNotMemberErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
