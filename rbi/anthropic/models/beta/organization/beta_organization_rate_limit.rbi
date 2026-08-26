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

          # Stable identifier for this rate-limit group within the organization.
          sig { returns(String) }
          attr_accessor :id

          # The kind of rate-limit group this entry represents. `model_group` entries apply
          # to a family of models (listed in `models`); other values apply to an API-surface
          # category and have `models` set to `null`.
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
            # Stable identifier for this rate-limit group within the organization.
            id:,
            # The kind of rate-limit group this entry represents. `model_group` entries apply
            # to a family of models (listed in `models`); other values apply to an API-surface
            # category and have `models` set to `null`.
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

          # The kind of rate-limit group this entry represents. `model_group` entries apply
          # to a family of models (listed in `models`); other values apply to an API-surface
          # category and have `models` set to `null`.
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
