# typed: strong

module Anthropic
  module Resources
    class Skills
      class Versions
        # Create Skill Version
        sig do
          params(
            skill_id: String,
            files: T::Array[Anthropic::Internal::FileInput],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Skills::SkillVersion)
        end
        def create(
          # Path param: Unique identifier for the skill.
          #
          # The format and length of IDs may change over time.
          skill_id,
          # Body param: Files to upload for the skill.
          #
          # All files must be in the same top-level directory and must include a SKILL.md
          # file at the root of that directory.
          files:,
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

        # Get Skill Version
        sig do
          params(
            version: String,
            skill_id: String,
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Skills::SkillVersion)
        end
        def retrieve(
          # Path param: Identifies the skill version: a version ID, or the literal `latest`
          # for the skill's most recent version.
          #
          # Requests carrying the `skills-2025-10-02` beta header address versions by their
          # Unix epoch timestamp instead (e.g., "1759178010641129").
          version,
          # Path param: Unique identifier for the skill.
          #
          # The format and length of IDs may change over time.
          skill_id:,
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

        # List Skill Versions
        sig do
          params(
            skill_id: String,
            limit: T.nilable(Integer),
            page: T.nilable(String),
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(
            Anthropic::Internal::PageCursor[Anthropic::Skills::SkillVersion]
          )
        end
        def list(
          # Path param: Unique identifier for the skill.
          #
          # The format and length of IDs may change over time.
          skill_id,
          # Query param: Number of results to return per page.
          #
          # Ranges from `1` to `1000`. Defaults to `20`.
          limit: nil,
          # Query param: Optionally set to the `next_page` token from the previous response.
          page: nil,
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

        # Delete Skill Version
        sig do
          params(
            version: String,
            skill_id: String,
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Skills::DeletedSkillVersion)
        end
        def delete(
          # Path param: Identifies the skill version by its version ID.
          #
          # Requests carrying the `skills-2025-10-02` beta header address versions by their
          # Unix epoch timestamp instead (e.g., "1759178010641129").
          version,
          # Path param: Unique identifier for the skill.
          #
          # The format and length of IDs may change over time.
          skill_id:,
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

        # @api private
        sig { params(client: Anthropic::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
