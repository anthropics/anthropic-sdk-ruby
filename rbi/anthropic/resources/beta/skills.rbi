# typed: strong

module Anthropic
  module Resources
    class Beta
      class Skills
        sig { returns(Anthropic::Resources::Beta::Skills::Versions) }
        attr_reader :versions

        # Create Skill
        sig do
          params(
            files: T::Array[Anthropic::Internal::FileInput],
            display_name: T.nilable(String),
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaSkill)
        end
        def create(
          # Body param: Files to upload for the skill.
          #
          # All files must be in the same top-level directory and must include a SKILL.md
          # file at the root of that directory.
          files:,
          # Body param: Human-readable, single-line label for the Skill. Maximum 255
          # characters. Always set: derived from the SKILL.md frontmatter `name` when
          # omitted at creation. Not unique.
          display_name: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          # Header param: Optional header to select the Workspace for this request. The
          # value is a Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          # Only needed for credentials that can act on more than one Workspace. A
          # credential that belongs to a specific Workspace may omit it; if sent, it must
          # match that Workspace.
          workspace_id: nil,
          request_options: {}
        )
        end

        # Get Skill
        sig do
          params(
            skill_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaSkill)
        end
        def retrieve(
          # Unique identifier for the skill.
          #
          # The format and length of IDs may change over time.
          skill_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          # Optional header to select the Workspace for this request. The value is a
          # Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          # Only needed for credentials that can act on more than one Workspace. A
          # credential that belongs to a specific Workspace may omit it; if sent, it must
          # match that Workspace.
          workspace_id: nil,
          request_options: {}
        )
        end

        # List Skills
        sig do
          params(
            limit: Integer,
            page: T.nilable(String),
            source: T.nilable(String),
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Internal::PageCursor[Anthropic::Beta::BetaSkill])
        end
        def list(
          # Query param: Number of results to return per page.
          #
          # Ranges from `1` to `1000`. Defaults to `20`.
          limit: nil,
          # Query param: Pagination token for fetching a specific page of results.
          #
          # Pass the value from a previous response's `next_page` field to get the next page
          # of results.
          page: nil,
          # Query param: Filter skills by source.
          #
          # If provided, only skills from the specified source will be returned:
          #
          # - `"custom"`: only return user-created skills
          # - `"anthropic"`: only return Anthropic-created skills
          source: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          # Header param: Optional header to select the Workspace for this request. The
          # value is a Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          # Only needed for credentials that can act on more than one Workspace. A
          # credential that belongs to a specific Workspace may omit it; if sent, it must
          # match that Workspace.
          workspace_id: nil,
          request_options: {}
        )
        end

        # Delete Skill
        sig do
          params(
            skill_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaDeletedSkill)
        end
        def delete(
          # Unique identifier for the skill.
          #
          # The format and length of IDs may change over time.
          skill_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          # Optional header to select the Workspace for this request. The value is a
          # Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          # Only needed for credentials that can act on more than one Workspace. A
          # credential that belongs to a specific Workspace may omit it; if sent, it must
          # match that Workspace.
          workspace_id: nil,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Anthropic::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
