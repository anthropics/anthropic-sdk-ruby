# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectCMEKEnabledParams < Anthropic::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKEnabledParams,
                      Anthropic::Internal::AnyHash
                    )
                  end

                sig { returns(Symbol) }
                attr_accessor :type

                # The External Key to use in each region, keyed by region code, such as `us` or
                # `eu`. An External Key ID (`ekey_...`) sets that region's key, `null` removes it,
                # and a region you leave out keeps its key. While the control is on, at least one
                # region must have a key.
                sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
                attr_reader :external_key_ids

                sig do
                  params(
                    external_key_ids: T::Hash[Symbol, T.nilable(String)]
                  ).void
                end
                attr_writer :external_key_ids

                # Turns the control on, or changes its keys while it is on.
                sig do
                  params(
                    external_key_ids: T::Hash[Symbol, T.nilable(String)],
                    type: Symbol
                  ).returns(T.attached_class)
                end
                def self.new(
                  # The External Key to use in each region, keyed by region code, such as `us` or
                  # `eu`. An External Key ID (`ekey_...`) sets that region's key, `null` removes it,
                  # and a region you leave out keeps its key. While the control is on, at least one
                  # region must have a key.
                  external_key_ids: nil,
                  type: :enabled
                )
                end

                sig do
                  override.returns(
                    {
                      type: Symbol,
                      external_key_ids: T::Hash[Symbol, T.nilable(String)]
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
