# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class ItemRetrieveParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Compliance::Review::ItemRetrieveParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # The ID of the item. For a message, its ID as the client received it or as a
            # review case lists it, such as `msg_...`.
            sig { returns(String) }
            attr_accessor :item_id

            # Optional header to specify the beta version(s) you want to use.
            sig do
              returns(
                T.nilable(
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
                )
              )
            end
            attr_reader :betas

            sig do
              params(
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
              ).void
            end
            attr_writer :betas

            # The ID of the user profile that the message was recorded with (`uprof_...`).
            # Send it for a message recorded with a user profile, and leave it out for a
            # message recorded with none.
            sig { returns(T.nilable(String)) }
            attr_reader :user_profile_id

            sig { params(user_profile_id: String).void }
            attr_writer :user_profile_id

            sig do
              params(
                item_id: String,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                user_profile_id: String,
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # The ID of the item. For a message, its ID as the client received it or as a
              # review case lists it, such as `msg_...`.
              item_id:,
              # Optional header to specify the beta version(s) you want to use.
              betas: nil,
              # The ID of the user profile that the message was recorded with (`uprof_...`).
              # Send it for a message recorded with a user profile, and leave it out for a
              # message recorded with none.
              user_profile_id: nil,
              request_options: {}
            )
            end

            sig do
              override.returns(
                {
                  item_id: String,
                  betas:
                    T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                  user_profile_id: String,
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
  end
end
