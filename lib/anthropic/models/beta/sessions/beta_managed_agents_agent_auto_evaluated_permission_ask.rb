# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsAgentAutoEvaluatedPermissionAsk < Anthropic::Internal::Type::BaseModel
          # @!attribute reason_code
          #   The judgement's grounds in registry-bound terms, for client branching and audit
          #   rather than end-user display. Open registry; currently "indeterminate" (no
          #   judgement was reached). Clients must tolerate values outside this set.
          #
          #   @return [String]
          required :reason_code, String

          # @!attribute type
          #
          #   @return [Symbol, :ask]
          required :type, const: :ask

          # @!method initialize(reason_code:, type: :ask)
          #   The server reached no judgement; the invocation is held for client approval.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionAsk}
          #   for more details.
          #
          #   @param reason_code [String] The judgement's grounds in registry-bound terms, for client branching and audit
          #
          #   @param type [Symbol, :ask]
        end
      end
    end
  end
end
