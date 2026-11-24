# typed: strong

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            # How to set the `cmek` control, discriminated by `type`.
            module BetaGoogleManagedCMEKControlParams
              extend Anthropic::Internal::Type::Union

              Variants =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKDisabledParams,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKEnabledParams
                  )
                end

              module Type
                extend Anthropic::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKControlParams::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                DISABLED =
                  T.let(
                    :disabled,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKControlParams::Type::TaggedSymbol
                  )
                ENABLED =
                  T.let(
                    :enabled,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKControlParams::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKControlParams::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKControlParams::Variants
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
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKControlParams::Type::OrSymbol,
                  external_key_ids:
                    T.nilable(T::Hash[Symbol, T.nilable(String)])
                ).returns(
                  Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKControlParams::Variants
                )
              end
              def self.new(
                type:,
                # The External Key to use in each region, keyed by region code, such as `us` or
                # `eu`. An External Key ID (`ekey_...`) sets that region's key, `null` removes it,
                # and a region you leave out keeps its key. While the control is on, at least one
                # region must have a key.
                external_key_ids: nil
              )
              end
            end
          end
        end
      end
    end
  end
end
