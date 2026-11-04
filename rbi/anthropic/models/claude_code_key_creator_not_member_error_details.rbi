# typed: strong

module Anthropic
  module Models
    class ClaudeCodeKeyCreatorNotMemberErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::ClaudeCodeKeyCreatorNotMemberErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The API key belongs to the Claude Code workspace, and the user who created it is
      # no longer a member of the organization or of that workspace.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :claude_code_key_creator_not_member)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
