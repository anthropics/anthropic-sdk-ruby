# typed: strong

module Anthropic
  module Models
    OrganizationRateLimit = Organization::OrganizationRateLimit

    module Organization
      class OrganizationRateLimit < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::OrganizationRateLimit,
              Anthropic::Internal::AnyHash
            )
          end

        # Identifier of this rate-limit entry. It is stable within the organization and
        # differs between organizations; the group's own identifier is `group.id`.
        sig { returns(String) }
        attr_accessor :id

        # The rate-limit group this entry's limits apply to. Its `type` equals
        # `group_type`.
        sig do
          returns(
            Anthropic::Organization::OrganizationRateLimit::Group::Variants
          )
        end
        attr_accessor :group

        # The limiter values that apply to this group.
        sig do
          returns(T::Array[Anthropic::Organization::OrganizationRateLimitValue])
        end
        attr_accessor :limits

        # Model names this entry's limits apply to, including aliases. `null` when
        # `group_type` is not `"model_group"`.
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :models

        # Object type. Always `rate_limit` for organization rate-limit entries.
        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            id: String,
            group:
              T.any(
                Anthropic::Organization::OrganizationRateLimitModelGroup::OrHash,
                Anthropic::Organization::OrganizationRateLimitBatchGroup::OrHash,
                Anthropic::Organization::OrganizationRateLimitTokenCountGroup::OrHash,
                Anthropic::Organization::OrganizationRateLimitFilesGroup::OrHash,
                Anthropic::Organization::OrganizationRateLimitSkillsGroup::OrHash,
                Anthropic::Organization::OrganizationRateLimitWebSearchGroup::OrHash
              ),
            limits:
              T::Array[
                Anthropic::Organization::OrganizationRateLimitValue::OrHash
              ],
            models: T.nilable(T::Array[String]),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Identifier of this rate-limit entry. It is stable within the organization and
          # differs between organizations; the group's own identifier is `group.id`.
          id:,
          # The rate-limit group this entry's limits apply to. Its `type` equals
          # `group_type`.
          group:,
          # The limiter values that apply to this group.
          limits:,
          # Model names this entry's limits apply to, including aliases. `null` when
          # `group_type` is not `"model_group"`.
          models:,
          # Object type. Always `rate_limit` for organization rate-limit entries.
          type: :rate_limit
        )
        end

        sig do
          override.returns(
            {
              id: String,
              group:
                Anthropic::Organization::OrganizationRateLimit::Group::Variants,
              limits:
                T::Array[Anthropic::Organization::OrganizationRateLimitValue],
              models: T.nilable(T::Array[String]),
              type: Symbol
            }
          )
        end
        def to_hash
        end

        # The rate-limit group this entry's limits apply to. Its `type` equals
        # `group_type`.
        module Group
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Organization::OrganizationRateLimitModelGroup,
                Anthropic::Organization::OrganizationRateLimitBatchGroup,
                Anthropic::Organization::OrganizationRateLimitTokenCountGroup,
                Anthropic::Organization::OrganizationRateLimitFilesGroup,
                Anthropic::Organization::OrganizationRateLimitSkillsGroup,
                Anthropic::Organization::OrganizationRateLimitWebSearchGroup
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Organization::OrganizationRateLimit::Group::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MODEL_GROUP =
              T.let(
                :model_group,
                Anthropic::Organization::OrganizationRateLimit::Group::Type::TaggedSymbol
              )
            BATCH =
              T.let(
                :batch,
                Anthropic::Organization::OrganizationRateLimit::Group::Type::TaggedSymbol
              )
            TOKEN_COUNT =
              T.let(
                :token_count,
                Anthropic::Organization::OrganizationRateLimit::Group::Type::TaggedSymbol
              )
            FILES =
              T.let(
                :files,
                Anthropic::Organization::OrganizationRateLimit::Group::Type::TaggedSymbol
              )
            SKILLS =
              T.let(
                :skills,
                Anthropic::Organization::OrganizationRateLimit::Group::Type::TaggedSymbol
              )
            WEB_SEARCH =
              T.let(
                :web_search,
                Anthropic::Organization::OrganizationRateLimit::Group::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Organization::OrganizationRateLimit::Group::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Organization::OrganizationRateLimit::Group::Variants
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
                Anthropic::Organization::OrganizationRateLimit::Group::Type::OrSymbol,
              id: String,
              display_name: String
            ).returns(
              Anthropic::Organization::OrganizationRateLimit::Group::Variants
            )
          end
          def self.new(
            type:,
            # Opaque identifier of the rate-limit group (for example,
            # `rlg_01VPTCmyiu5ZLsWkcxYG2pY8`). It is the same in every organization and never
            # changes, unlike the entry's own identifier, which differs per organization.
            id:,
            # Human-readable name of the model group (for example, `Claude Sonnet 4.x`). For
            # display only; it may change.
            display_name: nil
          )
          end
        end
      end
    end
  end
end
