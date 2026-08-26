# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class ServiceAccountUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::ServiceAccountUpdateParams,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the service account to update.
          sig { returns(String) }
          attr_accessor :service_account_id

          # Replaces the description. Omit to leave unchanged; send `null` to clear (the
          # field is stored as an empty string).
          sig { returns(T.nilable(String)) }
          attr_accessor :description

          # Replaces the org-level role. Omit or send `null` to leave unchanged.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::ServiceAccountUpdateParams::OrganizationRole::OrSymbol
              )
            )
          end
          attr_accessor :organization_role

          # Optional header to specify the beta version(s) you want to use.
          sig do
            returns(
              T.nilable(
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
              )
            )
          end
          attr_reader :betas

          sig do
            params(
              betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
            ).void
          end
          attr_writer :betas

          sig do
            params(
              service_account_id: String,
              description: T.nilable(String),
              organization_role:
                T.nilable(
                  Anthropic::Beta::Organization::ServiceAccountUpdateParams::OrganizationRole::OrSymbol
                ),
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of the service account to update.
            service_account_id:,
            # Replaces the description. Omit to leave unchanged; send `null` to clear (the
            # field is stored as an empty string).
            description: nil,
            # Replaces the org-level role. Omit or send `null` to leave unchanged.
            organization_role: nil,
            # Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                service_account_id: String,
                description: T.nilable(String),
                organization_role:
                  T.nilable(
                    Anthropic::Beta::Organization::ServiceAccountUpdateParams::OrganizationRole::OrSymbol
                  ),
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                request_options: Anthropic::RequestOptions
              }
            )
          end
          def to_hash
          end

          # Replaces the org-level role. Omit or send `null` to leave unchanged.
          module OrganizationRole
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::ServiceAccountUpdateParams::OrganizationRole
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ADMIN =
              T.let(
                :admin,
                Anthropic::Beta::Organization::ServiceAccountUpdateParams::OrganizationRole::TaggedSymbol
              )
            DEVELOPER =
              T.let(
                :developer,
                Anthropic::Beta::Organization::ServiceAccountUpdateParams::OrganizationRole::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::ServiceAccountUpdateParams::OrganizationRole::TaggedSymbol
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
