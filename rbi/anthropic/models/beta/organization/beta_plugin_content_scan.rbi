# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPluginContentScan < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaPluginContentScan,
                Anthropic::Internal::AnyHash
              )
            end

          # The scan's verdict; set only when `status` is `completed`.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaPluginContentScan::Assessment::TaggedSymbol
              )
            )
          end
          attr_accessor :assessment

          # The primary mechanism behind a `warn` or `fail`, such as `credential-exposure`
          # or `guardrail-tampering`; a mechanism this API does not yet name reads as
          # `other`. Null on a `pass`, whenever `assessment` is null, and when no mechanism
          # is reported for the verdict.
          sig { returns(T.nilable(String)) }
          attr_accessor :reason

          # `processing` while a scan runs, `completed` when it ran to completion, `errored`
          # when it could not run or its outcome cannot be read.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaPluginContentScan::Status::TaggedSymbol
            )
          end
          attr_accessor :status

          sig do
            params(
              assessment:
                T.nilable(
                  Anthropic::Beta::Organization::BetaPluginContentScan::Assessment::OrSymbol
                ),
              reason: T.nilable(String),
              status:
                Anthropic::Beta::Organization::BetaPluginContentScan::Status::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The scan's verdict; set only when `status` is `completed`.
            assessment:,
            # The primary mechanism behind a `warn` or `fail`, such as `credential-exposure`
            # or `guardrail-tampering`; a mechanism this API does not yet name reads as
            # `other`. Null on a `pass`, whenever `assessment` is null, and when no mechanism
            # is reported for the verdict.
            reason:,
            # `processing` while a scan runs, `completed` when it ran to completion, `errored`
            # when it could not run or its outcome cannot be read.
            status:
          )
          end

          sig do
            override.returns(
              {
                assessment:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaPluginContentScan::Assessment::TaggedSymbol
                  ),
                reason: T.nilable(String),
                status:
                  Anthropic::Beta::Organization::BetaPluginContentScan::Status::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # The scan's verdict; set only when `status` is `completed`.
          module Assessment
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaPluginContentScan::Assessment
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            FAIL =
              T.let(
                :fail,
                Anthropic::Beta::Organization::BetaPluginContentScan::Assessment::TaggedSymbol
              )
            PASS =
              T.let(
                :pass,
                Anthropic::Beta::Organization::BetaPluginContentScan::Assessment::TaggedSymbol
              )
            UNKNOWN =
              T.let(
                :unknown,
                Anthropic::Beta::Organization::BetaPluginContentScan::Assessment::TaggedSymbol
              )
            WARN =
              T.let(
                :warn,
                Anthropic::Beta::Organization::BetaPluginContentScan::Assessment::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaPluginContentScan::Assessment::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # `processing` while a scan runs, `completed` when it ran to completion, `errored`
          # when it could not run or its outcome cannot be read.
          module Status
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaPluginContentScan::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            COMPLETED =
              T.let(
                :completed,
                Anthropic::Beta::Organization::BetaPluginContentScan::Status::TaggedSymbol
              )
            ERRORED =
              T.let(
                :errored,
                Anthropic::Beta::Organization::BetaPluginContentScan::Status::TaggedSymbol
              )
            PROCESSING =
              T.let(
                :processing,
                Anthropic::Beta::Organization::BetaPluginContentScan::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaPluginContentScan::Status::TaggedSymbol
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
