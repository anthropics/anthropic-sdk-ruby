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

        # If present, replaces the stored external_id. Omit to leave unchanged. Maximum
        # 255 characters.
        sig { returns(T.nilable(String)) }
        attr_accessor :external_id

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

        # How the entity behind a user profile relates to the platform that owns the API
        # key. `external`: an individual end-user of the platform. `resold`: a company the
        # platform resells Claude access to. `internal`: the platform's own usage.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::UserProfileUpdateParams::Relationship::OrSymbol
            )
          )
        end
        attr_accessor :relationship

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
            external_id: T.nilable(String),
            metadata: T::Hash[Symbol, String],
            name: T.nilable(String),
            relationship:
              T.nilable(
                Anthropic::Beta::UserProfileUpdateParams::Relationship::OrSymbol
              ),
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          user_profile_id:,
          # If present, replaces the stored external_id. Omit to leave unchanged. Maximum
          # 255 characters.
          external_id: nil,
          # Key-value pairs to merge into the stored metadata. Keys provided overwrite
          # existing values. To remove a key, set its value to an empty string. Keys not
          # provided are left unchanged. Maximum 16 keys, with keys up to 64 characters and
          # values up to 512 characters.
          metadata: nil,
          # If present, replaces the stored name. Omit to leave unchanged. Maximum 255
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
              user_profile_id: String,
              external_id: T.nilable(String),
              metadata: T::Hash[Symbol, String],
              name: T.nilable(String),
              relationship:
                T.nilable(
                  Anthropic::Beta::UserProfileUpdateParams::Relationship::OrSymbol
                ),
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
                Anthropic::Beta::UserProfileUpdateParams::Relationship
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          EXTERNAL =
            T.let(
              :external,
              Anthropic::Beta::UserProfileUpdateParams::Relationship::TaggedSymbol
            )
          RESOLD =
            T.let(
              :resold,
              Anthropic::Beta::UserProfileUpdateParams::Relationship::TaggedSymbol
            )
          INTERNAL =
            T.let(
              :internal,
              Anthropic::Beta::UserProfileUpdateParams::Relationship::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::UserProfileUpdateParams::Relationship::TaggedSymbol
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
