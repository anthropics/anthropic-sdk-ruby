# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Federation
          class BetaServiceAccountTarget < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Federation::BetaServiceAccountTarget,
                  Anthropic::Internal::AnyHash
                )
              end

            # Tagged ID of the service account to mint tokens for.
            sig { returns(String) }
            attr_accessor :service_account_id

            sig { returns(Symbol) }
            attr_accessor :type

            # Service account's display name at read time. Ignored on writes.
            sig { returns(T.nilable(String)) }
            attr_accessor :service_account_name

            # Bind to a fixed service account by ID.
            sig do
              params(
                service_account_id: String,
                service_account_name: T.nilable(String),
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Tagged ID of the service account to mint tokens for.
              service_account_id:,
              # Service account's display name at read time. Ignored on writes.
              service_account_name: nil,
              type: :service_account
            )
            end

            sig do
              override.returns(
                {
                  service_account_id: String,
                  type: Symbol,
                  service_account_name: T.nilable(String)
                }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
