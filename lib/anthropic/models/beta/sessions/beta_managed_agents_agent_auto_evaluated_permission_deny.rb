# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsAgentAutoEvaluatedPermissionDeny < Anthropic::Internal::Type::BaseModel
          # @!attribute reason_code
          #   The judgement's grounds in registry-bound terms. Open registry; currently
          #   "high_risk" (judged high-risk; the call does not run). Clients must tolerate
          #   values outside this set.
          #
          #   @return [String]
          required :reason_code, String

          # @!attribute type
          #
          #   @return [Symbol, :deny]
          required :type, const: :deny

          # @!method initialize(reason_code:, type: :deny)
          #   The server judged the invocation high-risk; it does not execute and a synthetic
          #   error tool result is appended.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionDeny}
          #   for more details.
          #
          #   @param reason_code [String] The judgement's grounds in registry-bound terms. Open registry; currently
          #   "high\_
          #
          #   @param type [Symbol, :deny]
        end
      end
    end
  end
end
