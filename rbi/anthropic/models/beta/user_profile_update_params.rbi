# typed: strong

module Anthropic
  module Models
    module Beta
      class UserProfileUpdateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::UserProfileUpdateParams,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :user_profile_id

        # How the platform uses the API on behalf of the entity this profile represents.
        # `application`: the platform sells a product that uses the API behind the scenes,
        # and the profile represents an individual end-user of that product.
        # `passthrough`: the platform resells raw inference, and the profile identifies
        # the resold-to company.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::UserProfileUpdateParams::AccessType::OrSymbol
            )
          )
        end
        attr_accessor :access_type

        # If present, replaces the stored external_id. Omit to leave unchanged. Maximum
        # 255 characters.
        sig { returns(T.nilable(String)) }
        attr_accessor :external_id

        # A timestamp in RFC 3339 format
        sig { returns(T.nilable(Time)) }
        attr_reader :external_user_onboarded_at

        sig { params(external_user_onboarded_at: Time).void }
        attr_writer :external_user_onboarded_at

        # Key-value pairs to merge into the stored metadata. Keys provided overwrite
        # existing values. To remove a key, set its value to an empty string. Keys not
        # provided are left unchanged. Maximum 16 keys, with keys up to 64 characters and
        # values up to 512 characters.
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :metadata

        sig { params(metadata: T::Hash[Symbol, String]).void }
        attr_writer :metadata

        # If present, replaces the stored name. Omit to leave unchanged. Maximum 255
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
            user_profile_id: String,
            access_type:
              T.nilable(
                Anthropic::Beta::UserProfileUpdateParams::AccessType::OrSymbol
              ),
            external_id: T.nilable(String),
            external_user_onboarded_at: Time,
            metadata: T::Hash[Symbol, String],
            name: T.nilable(String),
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          user_profile_id:,
          # How the platform uses the API on behalf of the entity this profile represents.
          # `application`: the platform sells a product that uses the API behind the scenes,
          # and the profile represents an individual end-user of that product.
          # `passthrough`: the platform resells raw inference, and the profile identifies
          # the resold-to company.
          access_type: nil,
          # If present, replaces the stored external_id. Omit to leave unchanged. Maximum
          # 255 characters.
          external_id: nil,
          # A timestamp in RFC 3339 format
          external_user_onboarded_at: nil,
          # Key-value pairs to merge into the stored metadata. Keys provided overwrite
          # existing values. To remove a key, set its value to an empty string. Keys not
          # provided are left unchanged. Maximum 16 keys, with keys up to 64 characters and
          # values up to 512 characters.
          metadata: nil,
          # If present, replaces the stored name. Omit to leave unchanged. Maximum 255
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
              user_profile_id: String,
              access_type:
                T.nilable(
                  Anthropic::Beta::UserProfileUpdateParams::AccessType::OrSymbol
                ),
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
                Anthropic::Beta::UserProfileUpdateParams::AccessType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          APPLICATION =
            T.let(
              :application,
              Anthropic::Beta::UserProfileUpdateParams::AccessType::TaggedSymbol
            )
          PASSTHROUGH =
            T.let(
              :passthrough,
              Anthropic::Beta::UserProfileUpdateParams::AccessType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::UserProfileUpdateParams::AccessType::TaggedSymbol
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
