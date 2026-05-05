# typed: strong

module Anthropic
  module Models
    module Beta
      class UserProfileCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::UserProfileCreateParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Platform's own identifier for this user. Not enforced unique. Maximum 255
        # characters.
        sig { returns(T.nilable(String)) }
        attr_accessor :external_id

        # Free-form key-value data to attach to this user profile. Maximum 16 keys, with
        # keys up to 64 characters and values up to 512 characters. Values must be
        # non-empty strings.
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :metadata

        sig { params(metadata: T::Hash[Symbol, String]).void }
        attr_writer :metadata

        # Display name of the entity this profile represents. Required when relationship
        # is `resold` (the resold-to company's name); optional otherwise. Maximum 255
        # characters.
        sig { returns(T.nilable(String)) }
        attr_accessor :name

        # How the entity behind a user profile relates to the platform that owns the API
        # key. `external`: an individual end-user of the platform. `resold`: a company the
        # platform resells Claude access to. `internal`: the platform's own usage.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::UserProfileCreateParams::Relationship::OrSymbol
            )
          )
        end
        attr_reader :relationship

        sig do
          params(
            relationship:
              Anthropic::Beta::UserProfileCreateParams::Relationship::OrSymbol
          ).void
        end
        attr_writer :relationship

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
            external_id: T.nilable(String),
            metadata: T::Hash[Symbol, String],
            name: T.nilable(String),
            relationship:
              Anthropic::Beta::UserProfileCreateParams::Relationship::OrSymbol,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Platform's own identifier for this user. Not enforced unique. Maximum 255
          # characters.
          external_id: nil,
          # Free-form key-value data to attach to this user profile. Maximum 16 keys, with
          # keys up to 64 characters and values up to 512 characters. Values must be
          # non-empty strings.
          metadata: nil,
          # Display name of the entity this profile represents. Required when relationship
          # is `resold` (the resold-to company's name); optional otherwise. Maximum 255
          # characters.
          name: nil,
          # How the entity behind a user profile relates to the platform that owns the API
          # key. `external`: an individual end-user of the platform. `resold`: a company the
          # platform resells Claude access to. `internal`: the platform's own usage.
          relationship: nil,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              external_id: T.nilable(String),
              metadata: T::Hash[Symbol, String],
              name: T.nilable(String),
              relationship:
                Anthropic::Beta::UserProfileCreateParams::Relationship::OrSymbol,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions
            }
          )
        end
        def to_hash
        end

        # How the entity behind a user profile relates to the platform that owns the API
        # key. `external`: an individual end-user of the platform. `resold`: a company the
        # platform resells Claude access to. `internal`: the platform's own usage.
        module Relationship
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::UserProfileCreateParams::Relationship
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          EXTERNAL =
            T.let(
              :external,
              Anthropic::Beta::UserProfileCreateParams::Relationship::TaggedSymbol
            )
          RESOLD =
            T.let(
              :resold,
              Anthropic::Beta::UserProfileCreateParams::Relationship::TaggedSymbol
            )
          INTERNAL =
            T.let(
              :internal,
              Anthropic::Beta::UserProfileCreateParams::Relationship::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::UserProfileCreateParams::Relationship::TaggedSymbol
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
