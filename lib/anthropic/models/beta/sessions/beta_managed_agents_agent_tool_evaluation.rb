# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        # Names the resolved permission_policy that produced evaluated_permission, and
        # under auto carries the judgement. Open union: clients must tolerate unknown
        # variants.
        module BetaManagedAgentsAgentToolEvaluation
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # The resolved permission_policy was always_allow; accompanies evaluated_permission "allow".
          variant :always_allow, -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAlwaysAllow }

          # The resolved permission_policy was always_ask; accompanies evaluated_permission "ask".
          variant :always_ask, -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAlwaysAsk }

          # The resolved permission_policy was auto: the server judged this invocation individually.
          variant :auto, -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAuto }

          module Type
            extend Anthropic::Internal::Type::Enum

            ALWAYS_ALLOW = :always_allow
            ALWAYS_ASK = :always_ask
            AUTO = :auto

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAlwaysAllow, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAlwaysAsk, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAuto)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolEvaluation} for
          # more details.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionAllow, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionAsk, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionDeny] :evaluated_permission The server's per-invocation judgement under the auto permission policy. Its type
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAlwaysAllow, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAlwaysAsk, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAuto]
          def self.new(type:, **args)
            case type.to_sym
            when :always_allow
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAlwaysAllow.new(**args)
            when :always_ask
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAlwaysAsk.new(**args)
            when :auto
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAuto.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
