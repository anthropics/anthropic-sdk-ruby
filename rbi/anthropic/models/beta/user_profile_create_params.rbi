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

        # How the platform uses the API on behalf of the entity this profile represents.
        # `application`: the platform sells a product that uses the API behind the scenes,
        # and the profile represents an individual end-user of that product.
        # `passthrough`: the platform resells raw inference, and the profile identifies
        # the resold-to company.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::UserProfileCreateParams::AccessType::OrSymbol
            )
          )
        end
        attr_reader :access_type

        sig do
          params(
            access_type:
              Anthropic::Beta::UserProfileCreateParams::AccessType::OrSymbol
          ).void
        end
        attr_writer :access_type

        # Platform's own identifier for this user. Not enforced unique. Maximum 255
        # characters.
        sig { returns(T.nilable(String)) }
        attr_accessor :external_id

        # A timestamp in RFC 3339 format
        sig { returns(T.nilable(Time)) }
        attr_reader :external_user_onboarded_at

        sig { params(external_user_onboarded_at: Time).void }
        attr_writer :external_user_onboarded_at

        # Free-form key-value data to attach to this user profile. Maximum 16 keys, with
        # keys up to 64 characters and values up to 512 characters. Values must be
        # non-empty strings.
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :metadata

        sig { params(metadata: T::Hash[Symbol, String]).void }
        attr_writer :metadata

        # Optional for all profiles. Real-world name of the entity this profile represents
        # (company or individual); for a company the platform resells Claude access to
        # (`access_type` `passthrough`), that company's name where known. Maximum 255
        # characters.
        sig { returns(T.nilable(String)) }
        attr_accessor :name

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
            access_type:
              Anthropic::Beta::UserProfileCreateParams::AccessType::OrSymbol,
            external_id: T.nilable(String),
            external_user_onboarded_at: Time,
            metadata: T::Hash[Symbol, String],
            name: T.nilable(String),
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # How the platform uses the API on behalf of the entity this profile represents.
          # `application`: the platform sells a product that uses the API behind the scenes,
          # and the profile represents an individual end-user of that product.
          # `passthrough`: the platform resells raw inference, and the profile identifies
          # the resold-to company.
          access_type: nil,
          # Platform's own identifier for this user. Not enforced unique. Maximum 255
          # characters.
          external_id: nil,
          # A timestamp in RFC 3339 format
          external_user_onboarded_at: nil,
          # Free-form key-value data to attach to this user profile. Maximum 16 keys, with
          # keys up to 64 characters and values up to 512 characters. Values must be
          # non-empty strings.
          metadata: nil,
          # Optional for all profiles. Real-world name of the entity this profile represents
          # (company or individual); for a company the platform resells Claude access to
          # (`access_type` `passthrough`), that company's name where known. Maximum 255
          # characters.
          name: nil,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              access_type:
                Anthropic::Beta::UserProfileCreateParams::AccessType::OrSymbol,
              external_id: T.nilable(String),
              external_user_onboarded_at: Time,
              metadata: T::Hash[Symbol, String],
              name: T.nilable(String),
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions
            }
          )
        end
        def to_hash
        end

        # How the platform uses the API on behalf of the entity this profile represents.
        # `application`: the platform sells a product that uses the API behind the scenes,
        # and the profile represents an individual end-user of that product.
        # `passthrough`: the platform resells raw inference, and the profile identifies
        # the resold-to company.
        module AccessType
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::UserProfileCreateParams::AccessType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          APPLICATION =
            T.let(
              :application,
              Anthropic::Beta::UserProfileCreateParams::AccessType::TaggedSymbol
            )
          PASSTHROUGH =
            T.let(
              :passthrough,
              Anthropic::Beta::UserProfileCreateParams::AccessType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::UserProfileCreateParams::AccessType::TaggedSymbol
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
