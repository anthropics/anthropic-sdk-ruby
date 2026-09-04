# typed: strong

module Anthropic
  module Models
    module Skills
      class VersionListParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Skills::VersionListParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Unique identifier for the skill.
        #
        # The format and length of IDs may change over time.
        sig { returns(String) }
        attr_accessor :skill_id

        # Number of results to return per page.
        #
        # Ranges from `1` to `1000`. Defaults to `20`.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :limit

        # Optionally set to the `next_page` token from the previous response.
        sig { returns(T.nilable(String)) }
        attr_accessor :page

        sig { returns(T.nilable(String)) }
        attr_reader :workspace_id

        sig { params(workspace_id: String).void }
        attr_writer :workspace_id

        sig do
          params(
            skill_id: String,
            limit: T.nilable(Integer),
            page: T.nilable(String),
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier for the skill.
          #
          # The format and length of IDs may change over time.
          skill_id:,
          # Number of results to return per page.
          #
          # Ranges from `1` to `1000`. Defaults to `20`.
          limit: nil,
          # Optionally set to the `next_page` token from the previous response.
          page: nil,
          workspace_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              skill_id: String,
              limit: T.nilable(Integer),
              page: T.nilable(String),
              workspace_id: String,
              request_options: Anthropic::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
