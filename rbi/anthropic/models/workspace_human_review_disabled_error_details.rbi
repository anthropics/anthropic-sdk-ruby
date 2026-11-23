# typed: strong

module Anthropic
  module Models
    class WorkspaceHumanReviewDisabledErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::WorkspaceHumanReviewDisabledErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The request's Workspace has Human Review turned off, and this operation is not
      # available there. Use a Workspace with Human Review on.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :workspace_human_review_disabled)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
