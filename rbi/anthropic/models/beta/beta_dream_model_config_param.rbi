# typed: strong

module Anthropic
  module Models
    BetaDreamModelConfigParam = Beta::BetaDreamModelConfigParam

    module Beta
      class BetaDreamModelConfigParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaDreamModelConfigParam,
              Anthropic::Internal::AnyHash
            )
          end

        # The ID of the model to run the dream with.
        #
        # The ID can be 1 to 256 characters long.
        #
        # The
        # [limits table in the Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#limits)
        # lists the supported models.
        sig { returns(String) }
        attr_accessor :id

        # How fast the model generates output for the dream. Defaults to `standard`.
        #
        # Dreams accept only `standard`.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaDreamModelConfigParam::Speed::OrSymbol
            )
          )
        end
        attr_accessor :speed

        # The object form of `model` in a request to create a dream.
        sig do
          params(
            id: String,
            speed:
              T.nilable(
                Anthropic::Beta::BetaDreamModelConfigParam::Speed::OrSymbol
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # The ID of the model to run the dream with.
          #
          # The ID can be 1 to 256 characters long.
          #
          # The
          # [limits table in the Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#limits)
          # lists the supported models.
          id:,
          # How fast the model generates output for the dream. Defaults to `standard`.
          #
          # Dreams accept only `standard`.
          speed: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              speed:
                T.nilable(
                  Anthropic::Beta::BetaDreamModelConfigParam::Speed::OrSymbol
                )
            }
          )
        end
        def to_hash
        end

        # How fast the model generates output for the dream. Defaults to `standard`.
        #
        # Dreams accept only `standard`.
        module Speed
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaDreamModelConfigParam::Speed)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          STANDARD =
            T.let(
              :standard,
              Anthropic::Beta::BetaDreamModelConfigParam::Speed::TaggedSymbol
            )
          FAST =
            T.let(
              :fast,
              Anthropic::Beta::BetaDreamModelConfigParam::Speed::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaDreamModelConfigParam::Speed::TaggedSymbol
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
