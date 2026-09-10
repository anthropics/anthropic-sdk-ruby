# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        # The server's per-invocation judgement under the auto permission policy. Its type
        # always equals the event's top-level evaluated_permission. Open union: clients
        # must tolerate unknown variants.
        module BetaManagedAgentsAgentAutoEvaluatedPermission
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # The server judged the invocation safe to execute without client approval.
          variant :allow, -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionAllow }

          # The server reached no judgement; the invocation is held for client approval.
          variant :ask, -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionAsk }

          # The server judged the invocation high-risk; it does not execute and a synthetic error tool result is appended.
          variant :deny, -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionDeny }

          module Type
            extend Anthropic::Internal::Type::Enum

            ALLOW = :allow
            ASK = :ask
            DENY = :deny

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionAllow, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionAsk, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionDeny)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermission}
          # for more details.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :reason_code The judgement's grounds in registry-bound terms, for client branching and audit
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionAllow, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionAsk, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionDeny]
          def self.new(type:, **args)
            case type.to_sym
            when :allow
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionAllow.new(**args)
            when :ask
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionAsk.new(**args)
            when :deny
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionDeny.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
