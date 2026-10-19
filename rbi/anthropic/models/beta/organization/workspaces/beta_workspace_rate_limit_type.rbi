# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Workspaces
          # Rate limiter type.
          module BetaWorkspaceRateLimitType
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimitType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            FAST_ITPMCA =
              T.let(
                :fast_itpmca,
                Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimitType::TaggedSymbol
              )
            FAST_OTPM =
              T.let(
                :fast_otpm,
                Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimitType::TaggedSymbol
              )
            INPUT_TOKENS_PER_MINUTE =
              T.let(
                :input_tokens_per_minute,
                Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimitType::TaggedSymbol
              )
            INPUT_TOKENS_PER_MINUTE_CACHE_AWARE =
              T.let(
                :input_tokens_per_minute_cache_aware,
                Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimitType::TaggedSymbol
              )
            OUTPUT_TOKENS_PER_MINUTE =
              T.let(
                :output_tokens_per_minute,
                Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimitType::TaggedSymbol
              )
            REQUESTS_PER_MINUTE =
              T.let(
                :requests_per_minute,
                Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimitType::TaggedSymbol
              )
            TOKENS_PER_DAY =
              T.let(
                :tokens_per_day,
                Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimitType::TaggedSymbol
              )
            TOKENS_PER_MINUTE =
              T.let(
                :tokens_per_minute,
                Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimitType::TaggedSymbol
              )
            TOOL_USES_PER_SECOND =
              T.let(
                :tool_uses_per_second,
                Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimitType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimitType::TaggedSymbol
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
