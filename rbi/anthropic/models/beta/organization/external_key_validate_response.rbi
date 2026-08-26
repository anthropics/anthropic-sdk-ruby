# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class ExternalKeyValidateResponse < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Models::Beta::Organization::ExternalKeyValidateResponse,
                Anthropic::Internal::AnyHash
              )
            end

          # Error message when status is `failure`. Null otherwise.
          sig { returns(T.nilable(String)) }
          attr_accessor :error

          # `success` — encrypt/decrypt roundtrip succeeded. `failure` — the roundtrip
          # failed or timed out; see `error`.
          sig do
            returns(
              Anthropic::Models::Beta::Organization::ExternalKeyValidateResponse::Status::TaggedSymbol
            )
          end
          attr_accessor :status

          sig { returns(Symbol) }
          attr_accessor :type

          # Result of a validation roundtrip against the customer's KMS.
          #
          # HTTP 200 for both outcomes — the operation completed; `status` says whether the
          # key works.
          sig do
            params(
              error: T.nilable(String),
              status:
                Anthropic::Models::Beta::Organization::ExternalKeyValidateResponse::Status::OrSymbol,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Error message when status is `failure`. Null otherwise.
            error:,
            # `success` — encrypt/decrypt roundtrip succeeded. `failure` — the roundtrip
            # failed or timed out; see `error`.
            status:,
            type: :external_key_validation
          )
          end

          sig do
            override.returns(
              {
                error: T.nilable(String),
                status:
                  Anthropic::Models::Beta::Organization::ExternalKeyValidateResponse::Status::TaggedSymbol,
                type: Symbol
              }
            )
          end
          def to_hash
          end

          # `success` — encrypt/decrypt roundtrip succeeded. `failure` — the roundtrip
          # failed or timed out; see `error`.
          module Status
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Models::Beta::Organization::ExternalKeyValidateResponse::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            FAILURE =
              T.let(
                :failure,
                Anthropic::Models::Beta::Organization::ExternalKeyValidateResponse::Status::TaggedSymbol
              )
            SUCCESS =
              T.let(
                :success,
                Anthropic::Models::Beta::Organization::ExternalKeyValidateResponse::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Models::Beta::Organization::ExternalKeyValidateResponse::Status::TaggedSymbol
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
