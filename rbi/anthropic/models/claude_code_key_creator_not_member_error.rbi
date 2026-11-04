# typed: strong

module Anthropic
  module Models
    # The API key belongs to the Claude Code workspace, and the user who created it is
    # no longer a member of the organization or of that workspace.
    class ClaudeCodeKeyCreatorNotMemberError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::ClaudeCodeKeyCreatorNotMemberErrorDetails) }
      def details
      end
    end
  end
end
