# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPluginContentScan < Anthropic::Internal::Type::BaseModel
          # @!attribute assessment
          #   The scan's verdict; set only when `status` is `completed`. A `warn` can mean a
          #   `fail` that was allowed in claude.ai.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaPluginContentScan::Assessment, nil]
          required :assessment,
                   enum: -> { Anthropic::Beta::Organization::BetaPluginContentScan::Assessment },
                   nil?: true

          # @!attribute reason
          #   The primary mechanism behind a `warn` or `fail`, such as `credential-exposure`
          #   or `guardrail-tampering`; a mechanism this API does not yet name reads as
          #   `other`. Read `status` first: on an `errored` scan it is not a finding but why
          #   there is no verdict: `scan-invalid-archive`, the scan refused the version's
          #   archive, or could not process it, before checking what its files say, and
          #   running it again will not help, so change the files and store a new version;
          #   `scan-did-not-finish`, the scan did not finish or its result is no longer
          #   available, so retry the scan in claude.ai if it offers a retry;
          #   `scan-unavailable`, the scan could not run or its result cannot be read right
          #   now, so read the version again later, then retry the scan in claude.ai if it
          #   offers a retry. If these steps do not help, contact support. Null on a `pass`,
          #   while a scan runs, and when no mechanism is reported for the verdict. On an
          #   errored scan, null means that a compliance configuration ruled out the scan.
          #
          #   @return [String, nil]
          required :reason, String, nil?: true

          # @!attribute status
          #   `processing` while a scan runs, `completed` when it ran to completion, `errored`
          #   when it could not run. Once a scan of the version has completed, `content_scan`
          #   describes the newest completed scan, even while a later scan runs. While the
          #   scan outcome cannot be read, `status` is `errored` instead.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaPluginContentScan::Status]
          required :status, enum: -> { Anthropic::Beta::Organization::BetaPluginContentScan::Status }

          # @!method initialize(assessment:, reason:, status:)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaPluginContentScan} for more details.
          #
          #   @param assessment [Symbol, Anthropic::Models::Beta::Organization::BetaPluginContentScan::Assessment, nil] The scan's verdict; set only when `status` is `completed`. A `warn` can mean a
          #
          #   @param reason [String, nil] The primary mechanism behind a `warn` or `fail`, such as `credential-exposure` o
          #
          #   @param status [Symbol, Anthropic::Models::Beta::Organization::BetaPluginContentScan::Status] `processing` while a scan runs, `completed` when it ran to completion, `errored`

          # The scan's verdict; set only when `status` is `completed`. A `warn` can mean a
          # `fail` that was allowed in claude.ai.
          #
          # @see Anthropic::Models::Beta::Organization::BetaPluginContentScan#assessment
          module Assessment
            extend Anthropic::Internal::Type::Enum

            FAIL = :fail
            PASS = :pass
            UNKNOWN = :unknown
            WARN = :warn

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # `processing` while a scan runs, `completed` when it ran to completion, `errored`
          # when it could not run. Once a scan of the version has completed, `content_scan`
          # describes the newest completed scan, even while a later scan runs. While the
          # scan outcome cannot be read, `status` is `errored` instead.
          #
          # @see Anthropic::Models::Beta::Organization::BetaPluginContentScan#status
          module Status
            extend Anthropic::Internal::Type::Enum

            COMPLETED = :completed
            ERRORED = :errored
            PROCESSING = :processing

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
