# typed: strong

module Anthropic
  module Resources
    class Beta
      class Dreams
        # Create a Dream
        sig do
          params(
            inputs:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaDreamMemoryStoreInput::OrHash,
                  Anthropic::Beta::BetaDreamSessionsInput::OrHash
                )
              ],
            model:
              T.any(String, Anthropic::Beta::BetaDreamModelConfigParam::OrHash),
            instructions: T.nilable(String),
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaDream)
        end
        def create(
          # Body param
          inputs:,
          # Body param: Model identifier and configuration applied to every pipeline stage.
          model:,
          # Body param
          instructions: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Get a Dream
        sig do
          params(
            dream_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaDream)
        end
        def retrieve(
          # Path parameter dream_id
          dream_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # List Dreams
        sig do
          params(
            created_at_gt: Time,
            created_at_lt: Time,
            include_archived: T::Boolean,
            limit: Integer,
            page: String,
            statuses: T::Array[Anthropic::Beta::BetaDreamStatus::OrSymbol],
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Internal::PageCursor[Anthropic::Beta::BetaDream])
        end
        def list(
          # Query param: Return dreams with `created_at` strictly after this timestamp
          # (exclusive lower bound, RFC 3339). Unset applies no lower bound.
          created_at_gt: nil,
          # Query param: Return dreams with `created_at` strictly before this timestamp
          # (exclusive upper bound, RFC 3339). Unset applies no upper bound.
          created_at_lt: nil,
          # Query param: Query parameter for include_archived
          include_archived: nil,
          # Query param: Query parameter for limit
          limit: nil,
          # Query param: Query parameter for page
          page: nil,
          # Query param: Filter by lifecycle status. Repeat the parameter to match any of
          # multiple statuses. Empty applies no status filter.
          statuses: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Archive a Dream
        sig do
          params(
            dream_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaDream)
        end
        def archive(
          # Path parameter dream_id
          dream_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Cancel a Dream
        sig do
          params(
            dream_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaDream)
        end
        def cancel(
          # Path parameter dream_id
          dream_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Anthropic::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
