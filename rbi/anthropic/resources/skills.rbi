# typed: strong

module Anthropic
  module Resources
    class Skills
      sig { returns(Anthropic::Resources::Skills::Versions) }
      attr_reader :versions

      # Create Skill
      sig do
        params(
          files: T::Array[Anthropic::Internal::FileInput],
          display_name: T.nilable(String),
          request_options: Anthropic::RequestOptions::OrHash
        ).returns(Anthropic::Skill)
      end
      def create(
        # Files to upload for the skill.
        #
        # All files must be in the same top-level directory and must include a SKILL.md
        # file at the root of that directory.
        files:,
        # Human-readable, single-line label for the Skill. Maximum 255 characters. Always
        # set: derived from the SKILL.md frontmatter `name` when omitted at creation. Not
        # unique.
        display_name: nil,
        request_options: {}
      )
      end

      # Get Skill
      sig do
        params(
          skill_id: String,
          request_options: Anthropic::RequestOptions::OrHash
        ).returns(Anthropic::Skill)
      end
      def retrieve(
        # Unique identifier for the skill.
        #
        # The format and length of IDs may change over time.
        skill_id,
        request_options: {}
      )
      end

      # List Skills
      sig do
        params(
          limit: Integer,
          page: T.nilable(String),
          source: T.nilable(String),
          request_options: Anthropic::RequestOptions::OrHash
        ).returns(Anthropic::Internal::PageCursor[Anthropic::Skill])
      end
      def list(
        # Number of results to return per page.
        #
        # Ranges from `1` to `1000`. Defaults to `20`.
        limit: nil,
        # Pagination token for fetching a specific page of results.
        #
        # Pass the value from a previous response's `next_page` field to get the next page
        # of results.
        page: nil,
        # Filter skills by source.
        #
        # If provided, only skills from the specified source will be returned:
        #
        # - `"custom"`: only return user-created skills
        # - `"anthropic"`: only return Anthropic-created skills
        source: nil,
        request_options: {}
      )
      end

      # Delete Skill
      sig do
        params(
          skill_id: String,
          request_options: Anthropic::RequestOptions::OrHash
        ).returns(Anthropic::DeletedSkill)
      end
      def delete(
        # Unique identifier for the skill.
        #
        # The format and length of IDs may change over time.
        skill_id,
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
