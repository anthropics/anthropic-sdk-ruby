# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Workspaces
          class RateLimitListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Workspaces::RateLimitListParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # The ID of the workspace.
            sig { returns(String) }
            attr_accessor :workspace_id

            # Filter by group type.
            sig do
              returns(
                T.nilable(
                  Anthropic::Beta::Organization::Workspaces::RateLimitListParams::GroupType::OrSymbol
                )
              )
            end
            attr_accessor :group_type

            # Maximum number of items to return per page. Ranges from `1` to `1000`.
            #
            # Accepted for request-shape compatibility and currently ignored: every entry is
            # returned in a single page.
            sig { returns(T.nilable(Integer)) }
            attr_accessor :limit

            # Opaque cursor from a previous response's `next_page`.
            sig { returns(T.nilable(String)) }
            attr_accessor :page

            sig do
              params(
                workspace_id: String,
                group_type:
                  T.nilable(
                    Anthropic::Beta::Organization::Workspaces::RateLimitListParams::GroupType::OrSymbol
                  ),
                limit: T.nilable(Integer),
                page: T.nilable(String),
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # The ID of the workspace.
              workspace_id:,
              # Filter by group type.
              group_type: nil,
              # Maximum number of items to return per page. Ranges from `1` to `1000`.
              #
              # Accepted for request-shape compatibility and currently ignored: every entry is
              # returned in a single page.
              limit: nil,
              # Opaque cursor from a previous response's `next_page`.
              page: nil,
              request_options: {}
            )
            end

            sig do
              override.returns(
                {
                  workspace_id: String,
                  group_type:
                    T.nilable(
                      Anthropic::Beta::Organization::Workspaces::RateLimitListParams::GroupType::OrSymbol
                    ),
                  limit: T.nilable(Integer),
                  page: T.nilable(String),
                  request_options: Anthropic::RequestOptions
                }
              )
            end
            def to_hash
            end

            # Filter by group type.
            module GroupType
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Organization::Workspaces::RateLimitListParams::GroupType
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              BATCH =
                T.let(
                  :batch,
                  Anthropic::Beta::Organization::Workspaces::RateLimitListParams::GroupType::TaggedSymbol
                )
              FILES =
                T.let(
                  :files,
                  Anthropic::Beta::Organization::Workspaces::RateLimitListParams::GroupType::TaggedSymbol
                )
              MODEL_GROUP =
                T.let(
                  :model_group,
                  Anthropic::Beta::Organization::Workspaces::RateLimitListParams::GroupType::TaggedSymbol
                )
              SKILLS =
                T.let(
                  :skills,
                  Anthropic::Beta::Organization::Workspaces::RateLimitListParams::GroupType::TaggedSymbol
                )
              TOKEN_COUNT =
                T.let(
                  :token_count,
                  Anthropic::Beta::Organization::Workspaces::RateLimitListParams::GroupType::TaggedSymbol
                )
              WEB_SEARCH =
                T.let(
                  :web_search,
                  Anthropic::Beta::Organization::Workspaces::RateLimitListParams::GroupType::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::Workspaces::RateLimitListParams::GroupType::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end
      end
    end
  end
end
