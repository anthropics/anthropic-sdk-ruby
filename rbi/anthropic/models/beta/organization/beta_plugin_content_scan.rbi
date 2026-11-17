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

          # The scan's verdict; set only when `status` is `completed`. A `warn` can mean a
          # `fail` that was allowed in claude.ai.
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
          # `other`. Read `status` first: on an `errored` scan it is not a finding but why
          # there is no verdict: `scan-invalid-archive`, the scan refused the version's
          # archive, or could not process it, before checking what its files say, and
          # running it again will not help, so change the files and store a new version;
          # `scan-did-not-finish`, the scan did not finish or its result is no longer
          # available, so retry the scan in claude.ai if it offers a retry;
          # `scan-unavailable`, the scan could not run or its result cannot be read right
          # now, so read the version again later, then retry the scan in claude.ai if it
          # offers a retry. If these steps do not help, contact support. Null on a `pass`,
          # while a scan runs, and when no mechanism is reported for the verdict. On an
          # errored scan, null means that a compliance configuration ruled out the scan.
          sig { returns(T.nilable(String)) }
          attr_accessor :reason

          # `processing` while a scan runs, `completed` when it ran to completion, `errored`
          # when it could not run. Once a scan of the version has completed, `content_scan`
          # describes the newest completed scan, even while a later scan runs. While the
          # scan outcome cannot be read, `status` is `errored` instead.
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
            # The scan's verdict; set only when `status` is `completed`. A `warn` can mean a
            # `fail` that was allowed in claude.ai.
            assessment:,
            # The primary mechanism behind a `warn` or `fail`, such as `credential-exposure`
            # or `guardrail-tampering`; a mechanism this API does not yet name reads as
            # `other`. Read `status` first: on an `errored` scan it is not a finding but why
            # there is no verdict: `scan-invalid-archive`, the scan refused the version's
            # archive, or could not process it, before checking what its files say, and
            # running it again will not help, so change the files and store a new version;
            # `scan-did-not-finish`, the scan did not finish or its result is no longer
            # available, so retry the scan in claude.ai if it offers a retry;
            # `scan-unavailable`, the scan could not run or its result cannot be read right
            # now, so read the version again later, then retry the scan in claude.ai if it
            # offers a retry. If these steps do not help, contact support. Null on a `pass`,
            # while a scan runs, and when no mechanism is reported for the verdict. On an
            # errored scan, null means that a compliance configuration ruled out the scan.
            reason:,
            # `processing` while a scan runs, `completed` when it ran to completion, `errored`
            # when it could not run. Once a scan of the version has completed, `content_scan`
            # describes the newest completed scan, even while a later scan runs. While the
            # scan outcome cannot be read, `status` is `errored` instead.
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

          # The scan's verdict; set only when `status` is `completed`. A `warn` can mean a
          # `fail` that was allowed in claude.ai.
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
          # when it could not run. Once a scan of the version has completed, `content_scan`
          # describes the newest completed scan, even while a later scan runs. While the
          # scan outcome cannot be read, `status` is `errored` instead.
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
