# typed: strong

module Anthropic
  # Tracks which fallback a sequence of requests is pinned to.
  #
  # Create one and pass it via the `fallback_state` request option on every
  # request that should share the pin; {BetaRefusalFallbackMiddleware} mutates
  # it in place when a model refuses.
  class BetaFallbackState
    # Index into the fallback chain the requests are pinned to. `nil`/`-1`
    # targets the original request params.
    sig { returns(T.nilable(Integer)) }
    attr_accessor :index
  end

  # Middleware that retries refused `/v1/messages` requests down a fallback
  # chain. See {BetaRefusalFallbackMiddleware} in the gem source for the full
  # contract.
  class BetaRefusalFallbackMiddleware
    include Anthropic::Middleware

    DEFAULT_BETAS = T.let(T.unsafe(nil), T::Array[String])

    sig do
      params(
        fallbacks: T::Array[
          T.any(Anthropic::Models::Beta::BetaFallbackParam, T::Hash[Symbol, T.anything])
        ],
        betas: T::Array[String]
      ).void
    end
    def initialize(fallbacks, betas: DEFAULT_BETAS)
    end

    sig do
      override
        .params(
          request: Anthropic::APIRequest,
          nxt: T.proc.params(req: Anthropic::APIRequest).returns(Anthropic::APIResponse)
        )
        .returns(Anthropic::APIResponse)
    end
    def call(request, nxt)
    end
  end
end
