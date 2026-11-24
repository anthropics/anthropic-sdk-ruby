# typed: strong

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            class BetaGoogleManagedCMEKRegionSuspended < Anthropic::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionSuspended,
                    Anthropic::Internal::AnyHash
                  )
                end

              # The ID of the External Key that the region applies now (`ekey_...`). While a
              # replacement key is `pending` or `failed`, this is the previous key. `null` when
              # the region applies no key.
              sig { returns(T.nilable(String)) }
              attr_accessor :effective_external_key_id

              sig { returns(Symbol) }
              attr_accessor :type

              # Anthropic has withdrawn or paused its approval of customer-managed keys for this
              # profile, so the region does not apply the control.
              sig do
                params(
                  effective_external_key_id: T.nilable(String),
                  type: Symbol
                ).returns(T.attached_class)
              end
              def self.new(
                # The ID of the External Key that the region applies now (`ekey_...`). While a
                # replacement key is `pending` or `failed`, this is the previous key. `null` when
                # the region applies no key.
                effective_external_key_id:,
                type: :suspended
              )
              end

              sig do
                override.returns(
                  { effective_external_key_id: T.nilable(String), type: Symbol }
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
