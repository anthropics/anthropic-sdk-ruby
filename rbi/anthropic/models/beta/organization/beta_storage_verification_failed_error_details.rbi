# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaStorageVerificationFailedErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaStorageVerificationFailedErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          # One entry for each check that failed.
          sig do
            returns(
              T::Array[
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck
              ]
            )
          end
          attr_accessor :failed_checks

          # The request field at fault. Sent when the refused request is a Workspace's
          # create or update.
          sig { returns(T.nilable(String)) }
          attr_accessor :field

          # The External Storage failed verification, so the request changed nothing.
          # `failed_checks` lists what to fix.
          sig do
            params(
              failed_checks:
                T::Array[
                  Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::OrHash
                ],
              field: T.nilable(String),
              error_code: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # One entry for each check that failed.
            failed_checks:,
            # The request field at fault. Sent when the refused request is a Workspace's
            # create or update.
            field: nil,
            error_code: :storage_verification_failed
          )
          end

          sig do
            override.returns(
              {
                error_code: Symbol,
                failed_checks:
                  T::Array[
                    Anthropic::Beta::Organization::BetaExternalStorageFailedCheck
                  ],
                field: T.nilable(String)
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
