# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class APIKeyUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::APIKeyUpdateParams,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the API key.
          sig { returns(String) }
          attr_accessor :api_key_id

          # Name of the API key.
          sig { returns(T.nilable(String)) }
          attr_accessor :name

          # Status of the API key.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::APIKeyUpdateParams::Status::OrSymbol
              )
            )
          end
          attr_accessor :status

          sig do
            params(
              api_key_id: String,
              name: T.nilable(String),
              status:
                T.nilable(
                  Anthropic::Beta::Organization::APIKeyUpdateParams::Status::OrSymbol
                ),
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of the API key.
            api_key_id:,
            # Name of the API key.
            name: nil,
            # Status of the API key.
            status: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                api_key_id: String,
                name: T.nilable(String),
                status:
                  T.nilable(
                    Anthropic::Beta::Organization::APIKeyUpdateParams::Status::OrSymbol
                  ),
                request_options: Anthropic::RequestOptions
              }
            )
          end
          def to_hash
          end

          # Status of the API key.
          module Status
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::APIKeyUpdateParams::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ACTIVE =
              T.let(
                :active,
                Anthropic::Beta::Organization::APIKeyUpdateParams::Status::TaggedSymbol
              )
            ARCHIVED =
              T.let(
                :archived,
                Anthropic::Beta::Organization::APIKeyUpdateParams::Status::TaggedSymbol
              )
            INACTIVE =
              T.let(
                :inactive,
                Anthropic::Beta::Organization::APIKeyUpdateParams::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::APIKeyUpdateParams::Status::TaggedSymbol
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
end
