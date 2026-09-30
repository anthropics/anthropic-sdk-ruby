# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class SpendLimitListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::SpendLimitListParams,
                Anthropic::Internal::AnyHash
              )
            end

          # Maximum number of limits per page. Defaults to `20`.
          sig { returns(T.nilable(Integer)) }
          attr_reader :limit

          sig { params(limit: Integer).void }
          attr_writer :limit

          # Opaque cursor from a previous response's `next_page` field.
          sig { returns(T.nilable(String)) }
          attr_accessor :page

          # Return only limits with these scope types. A Claude Console organization has
          # `organization` and `workspace` limits; a Claude Enterprise organization has
          # `organization`, `seat_tier`, `rbac_group`, `organization_service` and `user`
          # limits. Omit for all.
          sig do
            returns(
              T.nilable(
                T::Array[
                  Anthropic::Beta::Organization::SpendLimitListParams::ScopeType::OrSymbol
                ]
              )
            )
          end
          attr_accessor :scope_type

          # This endpoint is in beta: requests must send `spend-limit-reads-2026-09-26` in
          # this header.
          sig do
            returns(
              T.nilable(
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
              )
            )
          end
          attr_reader :betas

          sig do
            params(
              betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
            ).void
          end
          attr_writer :betas

          sig do
            params(
              limit: Integer,
              page: T.nilable(String),
              scope_type:
                T.nilable(
                  T::Array[
                    Anthropic::Beta::Organization::SpendLimitListParams::ScopeType::OrSymbol
                  ]
                ),
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Maximum number of limits per page. Defaults to `20`.
            limit: nil,
            # Opaque cursor from a previous response's `next_page` field.
            page: nil,
            # Return only limits with these scope types. A Claude Console organization has
            # `organization` and `workspace` limits; a Claude Enterprise organization has
            # `organization`, `seat_tier`, `rbac_group`, `organization_service` and `user`
            # limits. Omit for all.
            scope_type: nil,
            # This endpoint is in beta: requests must send `spend-limit-reads-2026-09-26` in
            # this header.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                limit: Integer,
                page: T.nilable(String),
                scope_type:
                  T.nilable(
                    T::Array[
                      Anthropic::Beta::Organization::SpendLimitListParams::ScopeType::OrSymbol
                    ]
                  ),
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions
              }
            )
          end
          def to_hash
          end

          module ScopeType
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::SpendLimitListParams::ScopeType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ORGANIZATION =
              T.let(
                :organization,
                Anthropic::Beta::Organization::SpendLimitListParams::ScopeType::TaggedSymbol
              )
            ORGANIZATION_SERVICE =
              T.let(
                :organization_service,
                Anthropic::Beta::Organization::SpendLimitListParams::ScopeType::TaggedSymbol
              )
            RBAC_GROUP =
              T.let(
                :rbac_group,
                Anthropic::Beta::Organization::SpendLimitListParams::ScopeType::TaggedSymbol
              )
            SEAT_TIER =
              T.let(
                :seat_tier,
                Anthropic::Beta::Organization::SpendLimitListParams::ScopeType::TaggedSymbol
              )
            USER =
              T.let(
                :user,
                Anthropic::Beta::Organization::SpendLimitListParams::ScopeType::TaggedSymbol
              )
            WORKSPACE =
              T.let(
                :workspace,
                Anthropic::Beta::Organization::SpendLimitListParams::ScopeType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::SpendLimitListParams::ScopeType::TaggedSymbol
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
