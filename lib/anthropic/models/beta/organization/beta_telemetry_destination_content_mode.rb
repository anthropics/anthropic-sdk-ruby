# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # What the spans that the API exports to a telemetry destination contain.
        #
        # See the
        # [OpenTelemetry export guide](https://platform.claude.com/docs/en/manage-claude/opentelemetry#choose-a-content-mode)
        # to learn what the spans contain in each content mode.
        module BetaTelemetryDestinationContentMode
          extend Anthropic::Internal::Type::Enum

          # The spans contain identifiers, timing, status, token counts, and similar metadata. They don't contain prompt text, completion text, or tool inputs and outputs.
          METADATA_ONLY = :metadata_only

          # The spans contain the same metadata as `metadata_only`, plus message and tool content.
          #
          # An organization with a data-handling restriction, such as under HIPAA, can't choose this mode. The API exports only metadata for such an organization, even to a destination that already has `content`.
          CONTENT = :content

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
