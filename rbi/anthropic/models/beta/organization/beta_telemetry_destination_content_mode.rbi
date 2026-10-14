# typed: strong

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

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::Organization::BetaTelemetryDestinationContentMode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The spans contain identifiers, timing, status, token counts, and similar metadata. They don't contain prompt text, completion text, or tool inputs and outputs.
          METADATA_ONLY =
            T.let(
              :metadata_only,
              Anthropic::Beta::Organization::BetaTelemetryDestinationContentMode::TaggedSymbol
            )

          # The spans contain the same metadata as `metadata_only`, plus message and tool content.
          #
          # An organization with a data-handling restriction, such as under HIPAA, can't choose this mode. The API exports only metadata for such an organization, even to a destination that already has `content`.
          CONTENT =
            T.let(
              :content,
              Anthropic::Beta::Organization::BetaTelemetryDestinationContentMode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaTelemetryDestinationContentMode::TaggedSymbol
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
