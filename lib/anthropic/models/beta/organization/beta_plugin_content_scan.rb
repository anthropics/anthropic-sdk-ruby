# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPluginContentScan < Anthropic::Internal::Type::BaseModel
          # @!attribute assessment
          #   The scan's verdict; set only when `status` is `completed`.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaPluginContentScan::Assessment, nil]
          required :assessment,
                   enum: -> { Anthropic::Beta::Organization::BetaPluginContentScan::Assessment },
                   nil?: true

          # @!attribute reason
          #   The primary mechanism behind a `warn` or `fail`, such as `credential-exposure`
          #   or `guardrail-tampering`; a mechanism this API does not yet name reads as
          #   `other`. Null on a `pass`, whenever `assessment` is null, and when no mechanism
          #   is reported for the verdict.
          #
          #   @return [String, nil]
          required :reason, String, nil?: true

          # @!attribute status
          #   `processing` while a scan runs, `completed` when it ran to completion, `errored`
          #   when it could not run or its outcome cannot be read.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaPluginContentScan::Status]
          required :status, enum: -> { Anthropic::Beta::Organization::BetaPluginContentScan::Status }

          # @!method initialize(assessment:, reason:, status:)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaPluginContentScan} for more details.
          #
          #   @param assessment [Symbol, Anthropic::Models::Beta::Organization::BetaPluginContentScan::Assessment, nil] The scan's verdict; set only when `status` is `completed`.
          #
          #   @param reason [String, nil] The primary mechanism behind a `warn` or `fail`, such as `credential-exposure` o
          #
          #   @param status [Symbol, Anthropic::Models::Beta::Organization::BetaPluginContentScan::Status] `processing` while a scan runs, `completed` when it ran to completion, `errored`

          # The scan's verdict; set only when `status` is `completed`.
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
          # when it could not run or its outcome cannot be read.
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
