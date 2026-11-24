# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectCMEKDisabled < Anthropic::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKDisabled,
                      Anthropic::Internal::AnyHash
                    )
                  end

                # Keys that a region has retired, earliest `expires_at` first.
                sig do
                  returns(
                    T::Array[
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectRetiredKey
                    ]
                  )
                end
                attr_accessor :retired_keys

                sig { returns(Symbol) }
                attr_accessor :type

                # The control is off and has no keys.
                sig do
                  params(
                    retired_keys:
                      T::Array[
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectRetiredKey::OrHash
                      ],
                    type: Symbol
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Keys that a region has retired, earliest `expires_at` first.
                  retired_keys:,
                  type: :disabled
                )
                end

                sig do
                  override.returns(
                    {
                      retired_keys:
                        T::Array[
                          Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectRetiredKey
                        ],
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
