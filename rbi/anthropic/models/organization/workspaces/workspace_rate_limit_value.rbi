# typed: strong

module Anthropic
  module Models
    module Organization
      WorkspaceRateLimitValue = Workspaces::WorkspaceRateLimitValue

      module Workspaces
        class WorkspaceRateLimitValue < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Organization::Workspaces::WorkspaceRateLimitValue,
                Anthropic::Internal::AnyHash
              )
            end

          # The organization-level value for the same limiter type, for reference. `null`
          # when the organization has no limit configured for this limiter type.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :org_limit

          # Where `value` comes from. `organization` values are listed only when
          # `include_inherited` is `true`, and then `value` equals `org_limit`.
          sig do
            returns(
              Anthropic::Organization::Workspaces::WorkspaceRateLimitValue::Source::Variants
            )
          end
          attr_accessor :source

          # The limiter type (for example, `requests_per_minute` or
          # `input_tokens_per_minute`).
          sig { returns(String) }
          attr_accessor :type

          # The workspace's value for this limiter type: the workspace-level override when
          # `source.type` is `workspace`, otherwise the organization's value.
          sig { returns(Integer) }
          attr_accessor :value

          sig do
            params(
              org_limit: T.nilable(Integer),
              source:
                T.any(
                  Anthropic::Organization::Workspaces::WorkspaceRateLimitWorkspaceSource::OrHash,
                  Anthropic::Organization::Workspaces::WorkspaceRateLimitOrganizationSource::OrHash
                ),
              type: String,
              value: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # The organization-level value for the same limiter type, for reference. `null`
            # when the organization has no limit configured for this limiter type.
            org_limit:,
            # Where `value` comes from. `organization` values are listed only when
            # `include_inherited` is `true`, and then `value` equals `org_limit`.
            source:,
            # The limiter type (for example, `requests_per_minute` or
            # `input_tokens_per_minute`).
            type:,
            # The workspace's value for this limiter type: the workspace-level override when
            # `source.type` is `workspace`, otherwise the organization's value.
            value:
          )
          end

          sig do
            override.returns(
              {
                org_limit: T.nilable(Integer),
                source:
                  Anthropic::Organization::Workspaces::WorkspaceRateLimitValue::Source::Variants,
                type: String,
                value: Integer
              }
            )
          end
          def to_hash
          end

          # Where `value` comes from. `organization` values are listed only when
          # `include_inherited` is `true`, and then `value` equals `org_limit`.
          module Source
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Organization::Workspaces::WorkspaceRateLimitWorkspaceSource,
                  Anthropic::Organization::Workspaces::WorkspaceRateLimitOrganizationSource
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Organization::Workspaces::WorkspaceRateLimitValue::Source::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              WORKSPACE =
                T.let(
                  :workspace,
                  Anthropic::Organization::Workspaces::WorkspaceRateLimitValue::Source::Type::TaggedSymbol
                )
              ORGANIZATION =
                T.let(
                  :organization,
                  Anthropic::Organization::Workspaces::WorkspaceRateLimitValue::Source::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Organization::Workspaces::WorkspaceRateLimitValue::Source::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Organization::Workspaces::WorkspaceRateLimitValue::Source::Variants
                ]
              )
            end
            def self.variants
            end

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            sig do
              params(
                type:
                  Anthropic::Organization::Workspaces::WorkspaceRateLimitValue::Source::Type::OrSymbol
              ).returns(
                Anthropic::Organization::Workspaces::WorkspaceRateLimitValue::Source::Variants
              )
            end
            def self.new(type:)
            end
          end
        end
      end
    end
  end
end
