# typed: strong

module Anthropic
  module Models
    module Organization
      WorkspaceRateLimitType = Workspaces::WorkspaceRateLimitType

      module Workspaces
        # Rate limiter type.
        module WorkspaceRateLimitType
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Organization::Workspaces::WorkspaceRateLimitType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FAST_ITPMCA =
            T.let(
              :fast_itpmca,
              Anthropic::Organization::Workspaces::WorkspaceRateLimitType::TaggedSymbol
            )
          FAST_OTPM =
            T.let(
              :fast_otpm,
              Anthropic::Organization::Workspaces::WorkspaceRateLimitType::TaggedSymbol
            )
          INPUT_TOKENS_PER_MINUTE =
            T.let(
              :input_tokens_per_minute,
              Anthropic::Organization::Workspaces::WorkspaceRateLimitType::TaggedSymbol
            )
          INPUT_TOKENS_PER_MINUTE_CACHE_AWARE =
            T.let(
              :input_tokens_per_minute_cache_aware,
              Anthropic::Organization::Workspaces::WorkspaceRateLimitType::TaggedSymbol
            )
          OUTPUT_TOKENS_PER_MINUTE =
            T.let(
              :output_tokens_per_minute,
              Anthropic::Organization::Workspaces::WorkspaceRateLimitType::TaggedSymbol
            )
          REQUESTS_PER_MINUTE =
            T.let(
              :requests_per_minute,
              Anthropic::Organization::Workspaces::WorkspaceRateLimitType::TaggedSymbol
            )
          TOKENS_PER_DAY =
            T.let(
              :tokens_per_day,
              Anthropic::Organization::Workspaces::WorkspaceRateLimitType::TaggedSymbol
            )
          TOKENS_PER_MINUTE =
            T.let(
              :tokens_per_minute,
              Anthropic::Organization::Workspaces::WorkspaceRateLimitType::TaggedSymbol
            )
          TOOL_USES_PER_SECOND =
            T.let(
              :tool_uses_per_second,
              Anthropic::Organization::Workspaces::WorkspaceRateLimitType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Organization::Workspaces::WorkspaceRateLimitType::TaggedSymbol
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
