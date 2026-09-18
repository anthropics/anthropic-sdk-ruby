# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaOrganizationRateLimit < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaOrganizationRateLimit,
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
              Anthropic::Beta::Organization::BetaOrganizationRateLimit::Group::Variants
            )
          end
          attr_accessor :group

          # Deprecated: use `group.type` instead. The kind of rate-limit group this entry
          # represents. `model_group` entries apply to a family of models (listed in
          # `models`); other values apply to an API-surface category and have `models` set
          # to `null`. Always equal to `group.type`.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaOrganizationRateLimit::GroupType::TaggedSymbol
            )
          end
          attr_accessor :group_type

          # The limiter values that apply to this group.
          sig do
            returns(
              T::Array[
                Anthropic::Beta::Organization::BetaOrganizationRateLimitValue
              ]
            )
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
                  Anthropic::Beta::Organization::BetaOrganizationRateLimitModelGroup::OrHash,
                  Anthropic::Beta::Organization::BetaOrganizationRateLimitBatchGroup::OrHash,
                  Anthropic::Beta::Organization::BetaOrganizationRateLimitTokenCountGroup::OrHash,
                  Anthropic::Beta::Organization::BetaOrganizationRateLimitFilesGroup::OrHash,
                  Anthropic::Beta::Organization::BetaOrganizationRateLimitSkillsGroup::OrHash,
                  Anthropic::Beta::Organization::BetaOrganizationRateLimitWebSearchGroup::OrHash
                ),
              group_type:
                Anthropic::Beta::Organization::BetaOrganizationRateLimit::GroupType::OrSymbol,
              limits:
                T::Array[
                  Anthropic::Beta::Organization::BetaOrganizationRateLimitValue::OrHash
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
            # Deprecated: use `group.type` instead. The kind of rate-limit group this entry
            # represents. `model_group` entries apply to a family of models (listed in
            # `models`); other values apply to an API-surface category and have `models` set
            # to `null`. Always equal to `group.type`.
            group_type:,
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
                  Anthropic::Beta::Organization::BetaOrganizationRateLimit::Group::Variants,
                group_type:
                  Anthropic::Beta::Organization::BetaOrganizationRateLimit::GroupType::TaggedSymbol,
                limits:
                  T::Array[
                    Anthropic::Beta::Organization::BetaOrganizationRateLimitValue
                  ],
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
                  Anthropic::Beta::Organization::BetaOrganizationRateLimitModelGroup,
                  Anthropic::Beta::Organization::BetaOrganizationRateLimitBatchGroup,
                  Anthropic::Beta::Organization::BetaOrganizationRateLimitTokenCountGroup,
                  Anthropic::Beta::Organization::BetaOrganizationRateLimitFilesGroup,
                  Anthropic::Beta::Organization::BetaOrganizationRateLimitSkillsGroup,
                  Anthropic::Beta::Organization::BetaOrganizationRateLimitWebSearchGroup
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Organization::BetaOrganizationRateLimit::Group::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              MODEL_GROUP =
                T.let(
                  :model_group,
                  Anthropic::Beta::Organization::BetaOrganizationRateLimit::Group::Type::TaggedSymbol
                )
              BATCH =
                T.let(
                  :batch,
                  Anthropic::Beta::Organization::BetaOrganizationRateLimit::Group::Type::TaggedSymbol
                )
              TOKEN_COUNT =
                T.let(
                  :token_count,
                  Anthropic::Beta::Organization::BetaOrganizationRateLimit::Group::Type::TaggedSymbol
                )
              FILES =
                T.let(
                  :files,
                  Anthropic::Beta::Organization::BetaOrganizationRateLimit::Group::Type::TaggedSymbol
                )
              SKILLS =
                T.let(
                  :skills,
                  Anthropic::Beta::Organization::BetaOrganizationRateLimit::Group::Type::TaggedSymbol
                )
              WEB_SEARCH =
                T.let(
                  :web_search,
                  Anthropic::Beta::Organization::BetaOrganizationRateLimit::Group::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::BetaOrganizationRateLimit::Group::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaOrganizationRateLimit::Group::Variants
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
                  Anthropic::Beta::Organization::BetaOrganizationRateLimit::Group::Type::OrSymbol,
                id: String,
                display_name: String
              ).returns(
                Anthropic::Beta::Organization::BetaOrganizationRateLimit::Group::Variants
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

          # Deprecated: use `group.type` instead. The kind of rate-limit group this entry
          # represents. `model_group` entries apply to a family of models (listed in
          # `models`); other values apply to an API-surface category and have `models` set
          # to `null`. Always equal to `group.type`.
          module GroupType
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaOrganizationRateLimit::GroupType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            BATCH =
              T.let(
                :batch,
                Anthropic::Beta::Organization::BetaOrganizationRateLimit::GroupType::TaggedSymbol
              )
            FILES =
              T.let(
                :files,
                Anthropic::Beta::Organization::BetaOrganizationRateLimit::GroupType::TaggedSymbol
              )
            MODEL_GROUP =
              T.let(
                :model_group,
                Anthropic::Beta::Organization::BetaOrganizationRateLimit::GroupType::TaggedSymbol
              )
            SKILLS =
              T.let(
                :skills,
                Anthropic::Beta::Organization::BetaOrganizationRateLimit::GroupType::TaggedSymbol
              )
            TOKEN_COUNT =
              T.let(
                :token_count,
                Anthropic::Beta::Organization::BetaOrganizationRateLimit::GroupType::TaggedSymbol
              )
            WEB_SEARCH =
              T.let(
                :web_search,
                Anthropic::Beta::Organization::BetaOrganizationRateLimit::GroupType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaOrganizationRateLimit::GroupType::TaggedSymbol
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
