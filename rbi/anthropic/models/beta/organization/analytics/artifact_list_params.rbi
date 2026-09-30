# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Analytics
          class ArtifactListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Analytics::ArtifactListParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # UTC date in YYYY-MM-DD format. The day to get artifact activity for. Data is
            # typically available with a 1-day lag (varies by query; the error for a
            # too-recent date names the latest available day) and may be revised by a few
            # percent over the following days. No earlier than 2026-01-01.
            sig { returns(Date) }
            attr_accessor :date

            # Filters as `dimension:value`, e.g. `filter[]=rbac_group_id:{id}`. Repeat the
            # param for OR within a dimension and across dimensions for AND. Supported
            # dimensions on this endpoint: `artifact_type`, `is_shared`, `product`,
            # `rbac_group_id`, `user_id`. Value forms: `artifact_type` is a canonical artifact
            # MIME type (e.g. `text/markdown`) or `other`; `is_shared` is `true` or `false`;
            # `product` is `chat`, `claude_code`, or `cowork` (the surfaces that create
            # artifacts); `rbac_group_id` takes the tagged id (`rbac_group_...`, as emitted in
            # responses and by the spend-limits API) or a bare group UUID, and matches users
            # who held the group at any point during each covered UTC day (time-of-usage
            # attribution); `user_id` takes a tagged user id (`user_...`), as emitted in
            # responses. An unsupported dimension returns 400. At most 100 entries.
            sig { returns(T.nilable(T::Array[String])) }
            attr_accessor :filter

            # Dimensions to break results out by: `product`, `user_id` and/or `rbac_group_id`.
            # The ungrouped artifact-type cube is finite and returned in full; grouped queries
            # multiply the cube and paginate via `next_page`. `product` takes the values
            # `chat`, `claude_code`, or `cowork` (the surfaces that create artifacts).
            # `rbac_group_id` attributes a user to every group they held at any point during
            # the requested UTC day, so grouped rows are not an exclusive partition. At most
            # 100 entries.
            sig do
              returns(
                T.nilable(
                  T::Array[
                    Anthropic::Beta::Organization::Analytics::ArtifactListParams::GroupBy::OrSymbol
                  ]
                )
              )
            end
            attr_accessor :group_by

            # Maximum rows to return (1-1000, default 100). The ungrouped artifact-type cube
            # is finite and returned in full; `limit` is the page size only when `group_by[]`
            # multiplies the cube.
            sig { returns(T.nilable(Integer)) }
            attr_accessor :limit

            # Opaque cursor from a previous response's `next_page` field. Only valid with
            # `group_by[]` — the ungrouped cube is never paginated.
            sig { returns(T.nilable(String)) }
            attr_accessor :page

            sig do
              params(
                date: Date,
                filter: T.nilable(T::Array[String]),
                group_by:
                  T.nilable(
                    T::Array[
                      Anthropic::Beta::Organization::Analytics::ArtifactListParams::GroupBy::OrSymbol
                    ]
                  ),
                limit: T.nilable(Integer),
                page: T.nilable(String),
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # UTC date in YYYY-MM-DD format. The day to get artifact activity for. Data is
              # typically available with a 1-day lag (varies by query; the error for a
              # too-recent date names the latest available day) and may be revised by a few
              # percent over the following days. No earlier than 2026-01-01.
              date:,
              # Filters as `dimension:value`, e.g. `filter[]=rbac_group_id:{id}`. Repeat the
              # param for OR within a dimension and across dimensions for AND. Supported
              # dimensions on this endpoint: `artifact_type`, `is_shared`, `product`,
              # `rbac_group_id`, `user_id`. Value forms: `artifact_type` is a canonical artifact
              # MIME type (e.g. `text/markdown`) or `other`; `is_shared` is `true` or `false`;
              # `product` is `chat`, `claude_code`, or `cowork` (the surfaces that create
              # artifacts); `rbac_group_id` takes the tagged id (`rbac_group_...`, as emitted in
              # responses and by the spend-limits API) or a bare group UUID, and matches users
              # who held the group at any point during each covered UTC day (time-of-usage
              # attribution); `user_id` takes a tagged user id (`user_...`), as emitted in
              # responses. An unsupported dimension returns 400. At most 100 entries.
              filter: nil,
              # Dimensions to break results out by: `product`, `user_id` and/or `rbac_group_id`.
              # The ungrouped artifact-type cube is finite and returned in full; grouped queries
              # multiply the cube and paginate via `next_page`. `product` takes the values
              # `chat`, `claude_code`, or `cowork` (the surfaces that create artifacts).
              # `rbac_group_id` attributes a user to every group they held at any point during
              # the requested UTC day, so grouped rows are not an exclusive partition. At most
              # 100 entries.
              group_by: nil,
              # Maximum rows to return (1-1000, default 100). The ungrouped artifact-type cube
              # is finite and returned in full; `limit` is the page size only when `group_by[]`
              # multiplies the cube.
              limit: nil,
              # Opaque cursor from a previous response's `next_page` field. Only valid with
              # `group_by[]` — the ungrouped cube is never paginated.
              page: nil,
              request_options: {}
            )
            end

            sig do
              override.returns(
                {
                  date: Date,
                  filter: T.nilable(T::Array[String]),
                  group_by:
                    T.nilable(
                      T::Array[
                        Anthropic::Beta::Organization::Analytics::ArtifactListParams::GroupBy::OrSymbol
                      ]
                    ),
                  limit: T.nilable(Integer),
                  page: T.nilable(String),
                  request_options: Anthropic::RequestOptions
                }
              )
            end
            def to_hash
            end

            module GroupBy
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Organization::Analytics::ArtifactListParams::GroupBy
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              PRODUCT =
                T.let(
                  :product,
                  Anthropic::Beta::Organization::Analytics::ArtifactListParams::GroupBy::TaggedSymbol
                )
              RBAC_GROUP_ID =
                T.let(
                  :rbac_group_id,
                  Anthropic::Beta::Organization::Analytics::ArtifactListParams::GroupBy::TaggedSymbol
                )
              USER_ID =
                T.let(
                  :user_id,
                  Anthropic::Beta::Organization::Analytics::ArtifactListParams::GroupBy::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::Analytics::ArtifactListParams::GroupBy::TaggedSymbol
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
