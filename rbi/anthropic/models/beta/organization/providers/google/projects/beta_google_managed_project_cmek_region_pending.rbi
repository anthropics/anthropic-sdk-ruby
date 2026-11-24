# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectCMEKRegionPending < Anthropic::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionPending,
                      Anthropic::Internal::AnyHash
                    )
                  end

                # The ID of the External Key that the region applies now (`ekey_...`). While a
                # replacement key is `pending` or `failed`, this is the previous key. `null` when
                # the region applies no key.
                sig { returns(T.nilable(String)) }
                attr_accessor :effective_external_key_id

                # Why the latest validation attempt failed. `null` when no attempt has failed.
                sig { returns(T.nilable(String)) }
                attr_accessor :error

                sig { returns(Symbol) }
                attr_accessor :type

                # The region is validating the configured key, or the key has passed validation
                # and the region has not started to apply it.
                sig do
                  params(
                    effective_external_key_id: T.nilable(String),
                    error: T.nilable(String),
                    type: Symbol
                  ).returns(T.attached_class)
                end
                def self.new(
                  # The ID of the External Key that the region applies now (`ekey_...`). While a
                  # replacement key is `pending` or `failed`, this is the previous key. `null` when
                  # the region applies no key.
                  effective_external_key_id:,
                  # Why the latest validation attempt failed. `null` when no attempt has failed.
                  error:,
                  type: :pending
                )
                end

                sig do
                  override.returns(
                    {
                      effective_external_key_id: T.nilable(String),
                      error: T.nilable(String),
                      type: Symbol
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
  end
end
