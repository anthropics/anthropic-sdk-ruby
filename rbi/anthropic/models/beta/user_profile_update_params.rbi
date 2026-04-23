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
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
