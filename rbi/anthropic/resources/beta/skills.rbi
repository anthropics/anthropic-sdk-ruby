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
            display_title: T.nilable(String),
            files: T.nilable(T::Array[Anthropic::Internal::FileInput]),
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Models::Beta::SkillCreateResponse)
        end
        def create(
          # Body param: Display title for the skill.
          #
          # This is a human-readable label that is not included in the prompt sent to the
          # model.
          display_title: nil,
          # Body param: Files to upload for the skill.
          #
          # All files must be in the same top-level directory and must include a SKILL.md
          # file at the root of that directory.
          files: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Get Skill
        sig do
          params(
            skill_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Models::Beta::SkillRetrieveResponse)
        end
        def retrieve(
          # Unique identifier for the skill.
          #
          # The format and length of IDs may change over time.
          skill_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
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
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(
            Anthropic::Internal::PageCursor[
              Anthropic::Models::Beta::SkillListResponse
            ]
          )
        end
        def list(
          # Query param: Number of results to return per page.
          #
          # Maximum value is 100. Defaults to 20.
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
          request_options: {}
        )
        end

        # Delete Skill
        sig do
          params(
            skill_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Models::Beta::SkillDeleteResponse)
        end
        def delete(
          # Unique identifier for the skill.
          #
          # The format and length of IDs may change over time.
          skill_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
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
