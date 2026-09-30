# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsRepositoryAuthenticationError < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsRepositoryAuthenticationError,
                Anthropic::Internal::AnyHash
              )
            end

          # Human-readable error description.
          sig { returns(String) }
          attr_accessor :message

          # URL of the repository that could not be cloned. Null when it could not be
          # identified.
          sig { returns(T.nilable(String)) }
          attr_accessor :repository_url

          # What the client should do next. Always `retrying`: the session keeps running
          # without the repository.
          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsRepositoryAuthenticationError::RetryStatus::Variants
            )
          end
          attr_accessor :retry_status

          sig { returns(Symbol) }
          attr_accessor :type

          # The repository host rejected the credentials, or required credentials and
          # received none.
          sig do
            params(
              message: String,
              repository_url: T.nilable(String),
              retry_status:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal::OrHash
                ),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Human-readable error description.
            message:,
            # URL of the repository that could not be cloned. Null when it could not be
            # identified.
            repository_url:,
            # What the client should do next. Always `retrying`: the session keeps running
            # without the repository.
            retry_status:,
            type: :repository_authentication_error
          )
          end

          sig do
            override.returns(
              {
                message: String,
                repository_url: T.nilable(String),
                retry_status:
                  Anthropic::Beta::Sessions::BetaManagedAgentsRepositoryAuthenticationError::RetryStatus::Variants,
                type: Symbol
              }
            )
          end
          def to_hash
          end

          # What the client should do next. Always `retrying`: the session keeps running
          # without the repository.
          module RetryStatus
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying,
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted,
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Sessions::BetaManagedAgentsRepositoryAuthenticationError::RetryStatus::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              RETRYING =
                T.let(
                  :retrying,
                  Anthropic::Beta::Sessions::BetaManagedAgentsRepositoryAuthenticationError::RetryStatus::Type::TaggedSymbol
                )
              EXHAUSTED =
                T.let(
                  :exhausted,
                  Anthropic::Beta::Sessions::BetaManagedAgentsRepositoryAuthenticationError::RetryStatus::Type::TaggedSymbol
                )
              TERMINAL =
                T.let(
                  :terminal,
                  Anthropic::Beta::Sessions::BetaManagedAgentsRepositoryAuthenticationError::RetryStatus::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Sessions::BetaManagedAgentsRepositoryAuthenticationError::RetryStatus::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsRepositoryAuthenticationError::RetryStatus::Variants
                ]
              )
            end
            def self.variants
            end

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            sig do
              params(
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsRepositoryAuthenticationError::RetryStatus::Type::OrSymbol
              ).returns(
                Anthropic::Beta::Sessions::BetaManagedAgentsRepositoryAuthenticationError::RetryStatus::Variants
              )
            end
            def self.new(type:)
            end
          end
        end
      end
    end
  end
end
