# typed: strong

module Anthropic
  module Resources
    class Beta
      class Skills
        class Versions
          # Create Skill Version
          sig do
            params(
              skill_id: String,
              files: T.nilable(T::Array[Anthropic::Internal::FileInput]),
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Models::Beta::Skills::VersionCreateResponse)
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
            files: nil,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # Get Skill Version
          sig do
            params(
              version: String,
              skill_id: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Models::Beta::Skills::VersionRetrieveResponse)
          end
          def retrieve(
            # Path param: Version identifier for the skill.
            #
            # Each version is identified by a Unix epoch timestamp (e.g., "1759178010641129").
            version,
            # Path param: Unique identifier for the skill.
            #
            # The format and length of IDs may change over time.
            skill_id:,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # List Skill Versions
          sig do
            params(
              skill_id: String,
              limit: T.nilable(Integer),
              page: T.nilable(String),
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Internal::PageCursor[
                Anthropic::Models::Beta::Skills::VersionListResponse
              ]
            )
          end
          def list(
            # Path param: Unique identifier for the skill.
            #
            # The format and length of IDs may change over time.
            skill_id,
            # Query param: Number of items to return per page.
            #
            # Defaults to `20`. Ranges from `1` to `1000`.
            limit: nil,
            # Query param: Optionally set to the `next_page` token from the previous response.
            page: nil,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # Delete Skill Version
          sig do
            params(
              version: String,
              skill_id: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Models::Beta::Skills::VersionDeleteResponse)
          end
          def delete(
            # Path param: Version identifier for the skill.
            #
            # Each version is identified by a Unix epoch timestamp (e.g., "1759178010641129").
            version,
            # Path param: Unique identifier for the skill.
            #
            # The format and length of IDs may change over time.
            skill_id:,
            # Header param: Optional header to specify the beta version(s) you want to use.
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
end
