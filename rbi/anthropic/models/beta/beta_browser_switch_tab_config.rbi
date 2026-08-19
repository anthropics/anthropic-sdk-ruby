# typed: strong

module Anthropic
  module Models
    BetaBrowserSwitchTabConfig = Beta::BetaBrowserSwitchTabConfig

    module Beta
      class BetaBrowserSwitchTabConfig < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserSwitchTabConfig,
              Anthropic::Internal::AnyHash
            )
          end

        # Defer loading for this member. Must resolve to the same value on every enabled
        # member of the toolset.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :defer_loading

        # Whether this member is offered to the model. Default is per member, per the
        # toolset's documentation. A member whose enabled resolves false is withheld from
        # the served schema.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :enabled

        # `switch_tab`'s config overrides.
        sig do
          params(
            defer_loading: T.nilable(T::Boolean),
            enabled: T.nilable(T::Boolean)
          ).returns(T.attached_class)
        end
        def self.new(
          # Defer loading for this member. Must resolve to the same value on every enabled
          # member of the toolset.
          defer_loading: nil,
          # Whether this member is offered to the model. Default is per member, per the
          # toolset's documentation. A member whose enabled resolves false is withheld from
          # the served schema.
          enabled: nil
        )
        end

        sig do
          override.returns(
            {
              defer_loading: T.nilable(T::Boolean),
              enabled: T.nilable(T::Boolean)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
