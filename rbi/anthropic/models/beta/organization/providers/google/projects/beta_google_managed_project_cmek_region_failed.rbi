# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectCMEKRegionFailed < Anthropic::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionFailed,
                      Anthropic::Internal::AnyHash
                    )
                  end

                # The ID of the External Key that the region applies now (`ekey_...`). While a
                # replacement key is `pending` or `failed`, this is the previous key. `null` when
                # the region applies no key.
                sig { returns(T.nilable(String)) }
                attr_accessor :effective_external_key_id

                # Why the region cannot use the configured key.
                sig { returns(String) }
                attr_accessor :error

                sig { returns(Symbol) }
                attr_accessor :type

                # The region stopped retrying validation before the configured key passed. To
                # restart validation, send the region a key again. It can be the same key.
                sig do
                  params(
                    effective_external_key_id: T.nilable(String),
                    error: String,
                    type: Symbol
                  ).returns(T.attached_class)
                end
                def self.new(
                  # The ID of the External Key that the region applies now (`ekey_...`). While a
                  # replacement key is `pending` or `failed`, this is the previous key. `null` when
                  # the region applies no key.
                  effective_external_key_id:,
                  # Why the region cannot use the configured key.
                  error:,
                  type: :failed
                )
                end

                sig do
                  override.returns(
                    {
                      effective_external_key_id: T.nilable(String),
                      error: String,
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
