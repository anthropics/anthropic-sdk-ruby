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
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Skills::SkillVersion)
        end
        def create(
          # Unique identifier for the skill.
          #
          # The format and length of IDs may change over time.
          skill_id,
          # Files to upload for the skill.
          #
          # All files must be in the same top-level directory and must include a SKILL.md
          # file at the root of that directory.
          files:,
          request_options: {}
        )
        end

        # Get Skill Version
        sig do
          params(
            version: String,
            skill_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Skills::SkillVersion)
        end
        def retrieve(
          # Identifies the skill version: a version ID, or — where the endpoint accepts it —
          # the literal `latest` for the skill's most recent version.
          #
          # Requests carrying the `skills-2025-10-02` beta header address versions by their
          # Unix epoch timestamp instead (e.g., "1759178010641129").
          version,
          # Unique identifier for the skill.
          #
          # The format and length of IDs may change over time.
          skill_id:,
          request_options: {}
        )
        end

        # List Skill Versions
        sig do
          params(
            skill_id: String,
            limit: T.nilable(Integer),
            page: T.nilable(String),
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(
            Anthropic::Internal::PageCursor[Anthropic::Skills::SkillVersion]
          )
        end
        def list(
          # Unique identifier for the skill.
          #
          # The format and length of IDs may change over time.
          skill_id,
          # Number of results to return per page.
          #
          # Ranges from `1` to `1000`. Defaults to `20`.
          limit: nil,
          # Optionally set to the `next_page` token from the previous response.
          page: nil,
          request_options: {}
        )
        end

        # Delete Skill Version
        sig do
          params(
            version: String,
            skill_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Skills::DeletedSkillVersion)
        end
        def delete(
          # Identifies the skill version: a version ID, or — where the endpoint accepts it —
          # the literal `latest` for the skill's most recent version.
          #
          # Requests carrying the `skills-2025-10-02` beta header address versions by their
          # Unix epoch timestamp instead (e.g., "1759178010641129").
          version,
          # Unique identifier for the skill.
          #
          # The format and length of IDs may change over time.
          skill_id:,
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
