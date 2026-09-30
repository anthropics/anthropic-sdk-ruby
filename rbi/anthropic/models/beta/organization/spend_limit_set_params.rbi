# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class SpendLimitSetParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::SpendLimitSetParams,
                Anthropic::Internal::AnyHash
              )
            end

          # Limit amount as a non-negative integer decimal string in the minor unit of the
          # organization's billing currency (cents for USD): "50000" is $500.00. `null` sets
          # an explicit no-limit override for this scope and `period` only — each period
          # resolves independently, so caps for other periods still apply.
          sig { returns(T.nilable(String)) }
          attr_accessor :amount

          # What the limit applies to. Claude Enterprise organizations set `user` limits.
          # Claude Console organizations set `organization` and `workspace` limits. Any
          # other combination returns 400. Setting `organization` and `workspace` limits
          # through the API is in an early access preview. To request access, contact your
          # Anthropic account team.
          sig do
            returns(
              T.any(
                Anthropic::Beta::Organization::BetaSpendLimitUserScope,
                Anthropic::Beta::Organization::BetaSpendLimitOrganizationScope,
                Anthropic::Beta::Organization::BetaSpendLimitWorkspaceScope
              )
            )
          end
          attr_accessor :scope

          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaSpendLimitPeriod::OrSymbol
              )
            )
          end
          attr_reader :period

          sig do
            params(
              period:
                Anthropic::Beta::Organization::BetaSpendLimitPeriod::OrSymbol
            ).void
          end
          attr_writer :period

          sig do
            params(
              amount: T.nilable(String),
              scope:
                T.any(
                  Anthropic::Beta::Organization::BetaSpendLimitUserScope::OrHash,
                  Anthropic::Beta::Organization::BetaSpendLimitOrganizationScope::OrHash,
                  Anthropic::Beta::Organization::BetaSpendLimitWorkspaceScope::OrHash
                ),
              period:
                Anthropic::Beta::Organization::BetaSpendLimitPeriod::OrSymbol,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Limit amount as a non-negative integer decimal string in the minor unit of the
            # organization's billing currency (cents for USD): "50000" is $500.00. `null` sets
            # an explicit no-limit override for this scope and `period` only — each period
            # resolves independently, so caps for other periods still apply.
            amount:,
            # What the limit applies to. Claude Enterprise organizations set `user` limits.
            # Claude Console organizations set `organization` and `workspace` limits. Any
            # other combination returns 400. Setting `organization` and `workspace` limits
            # through the API is in an early access preview. To request access, contact your
            # Anthropic account team.
            scope:,
            period: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                amount: T.nilable(String),
                scope:
                  T.any(
                    Anthropic::Beta::Organization::BetaSpendLimitUserScope,
                    Anthropic::Beta::Organization::BetaSpendLimitOrganizationScope,
                    Anthropic::Beta::Organization::BetaSpendLimitWorkspaceScope
                  ),
                period:
                  Anthropic::Beta::Organization::BetaSpendLimitPeriod::OrSymbol,
                request_options: Anthropic::RequestOptions
              }
            )
          end
          def to_hash
          end

          # What the limit applies to. Claude Enterprise organizations set `user` limits.
          # Claude Console organizations set `organization` and `workspace` limits. Any
          # other combination returns 400. Setting `organization` and `workspace` limits
          # through the API is in an early access preview. To request access, contact your
          # Anthropic account team.
          module Scope
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::BetaSpendLimitUserScope,
                  Anthropic::Beta::Organization::BetaSpendLimitOrganizationScope,
                  Anthropic::Beta::Organization::BetaSpendLimitWorkspaceScope
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Organization::SpendLimitSetParams::Scope::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              USER =
                T.let(
                  :user,
                  Anthropic::Beta::Organization::SpendLimitSetParams::Scope::Type::TaggedSymbol
                )
              ORGANIZATION =
                T.let(
                  :organization,
                  Anthropic::Beta::Organization::SpendLimitSetParams::Scope::Type::TaggedSymbol
                )
              WORKSPACE =
                T.let(
                  :workspace,
                  Anthropic::Beta::Organization::SpendLimitSetParams::Scope::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::SpendLimitSetParams::Scope::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::SpendLimitSetParams::Scope::Variants
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
                  Anthropic::Beta::Organization::SpendLimitSetParams::Scope::Type::OrSymbol,
                user_id: String,
                workspace_id: String
              ).returns(
                Anthropic::Beta::Organization::SpendLimitSetParams::Scope::Variants
              )
            end
            def self.new(
              type:,
              # Tagged ID of the member the spend limit applies to.
              user_id: nil,
              # Tagged ID of the workspace the spend limit applies to.
              workspace_id: nil
            )
            end
          end
        end
      end
    end
  end
end
