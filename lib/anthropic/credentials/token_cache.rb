# frozen_string_literal: true

module Anthropic
  module Credentials
    # Thread-safe cache wrapping an access token provider with two-tier
    # proactive refresh and single-flight semantics.
    #
    # Refresh policy on each {#get_token} call:
    #
    # * No cached token → call provider (blocking), cache, return.
    # * Cached with +expires_at=nil+ → return cached forever (never refresh).
    # * More than +advisory_refresh_seconds+ remaining → return cached.
    # * Between +mandatory_refresh_seconds+ and +advisory_refresh_seconds+
    #   remaining (advisory window) → try provider; on success swap cache; on
    #   failure log a warning and return the stale cached token. If another
    #   caller is already refreshing, the advisory caller just returns the
    #   cached token — no second refresh, no waiting.
    # * Less than +mandatory_refresh_seconds+ remaining or already expired
    #   (mandatory window) → call provider; on failure RAISE. Concurrent
    #   mandatory callers wait on a shared condition so exactly one provider
    #   call is in flight.
    #
    # The lock is released before the provider call so a 30-second HTTP POST
    # doesn't serialize unrelated callers through a single thread.
    class TokenCache
      # Seconds to skip advisory refreshes after a failure to avoid hammering
      # a failing token endpoint.
      ADVISORY_REFRESH_BACKOFF_SECONDS = 5

      # @param provider [#call] an access token provider that responds to +call+
      #   and returns an {AccessToken}
      # @param advisory_refresh_seconds [Integer] seconds before expiry to attempt
      #   a non-blocking advisory refresh (default: 120)
      # @param mandatory_refresh_seconds [Integer] seconds before expiry when refresh
      #   becomes mandatory and blocking (default: 30)
      # @param time_source [Proc] callable returning current time as Float (for testing)
      def initialize(
        provider,
        advisory_refresh_seconds: ADVISORY_REFRESH_SECONDS,
        mandatory_refresh_seconds: MANDATORY_REFRESH_SECONDS,
        time_source: -> { Time.now.to_f }
      )
        @provider = provider
        @advisory = advisory_refresh_seconds
        @mandatory = mandatory_refresh_seconds
        @time_source = time_source
        @lock = Monitor.new
        @cached = nil
        @refresh_in_progress = false
        @refresh_condition = @lock.new_cond
        @next_force = false
        @last_advisory_failure_time = 0.0
        @provider_accepts_force_refresh = detect_force_refresh_support
      end

      # Returns a valid bearer token, refreshing if necessary.
      #
      # This method is thread-safe. Multiple threads calling +get_token+
      # simultaneously will coordinate to avoid redundant provider calls.
      #
      # @return [String] the bearer token string
      # @raise [Anthropic::Errors::Error] if the provider fails during mandatory refresh
      def get_token
        loop do # rubocop:disable Metrics/BlockLength
          advisory_fallback = nil
          should_refresh = false

          @lock.synchronize do
            if @cached
              if @cached.expires_at.nil?
                return @cached.token
              end

              remaining = @cached.expires_at - @time_source.call
              if remaining > @advisory
                return @cached.token
              end

              if remaining > @mandatory
                if @refresh_in_progress
                  return @cached.token
                end
                if @time_source.call - @last_advisory_failure_time < ADVISORY_REFRESH_BACKOFF_SECONDS
                  return @cached.token
                end
                advisory_fallback = @cached
              end
            end

            if @refresh_in_progress
              @refresh_condition.wait
              next
            end

            @refresh_in_progress = true
            should_refresh = true
          end

          next unless should_refresh

          begin
            force = @lock.synchronize { @next_force }
            fresh = invoke_provider(force: force)
            @lock.synchronize do
              @next_force = false
              @cached = fresh
            end
            return fresh.token
          rescue Anthropic::Errors::Error, IOError
            raise if advisory_fallback.nil?

            @lock.synchronize { @last_advisory_failure_time = @time_source.call }
            return advisory_fallback.token
          ensure
            @lock.synchronize do
              @refresh_in_progress = false
              @refresh_condition.broadcast
            end
          end
        end
      end

      # Clears the cached token so the next {#get_token} re-invokes the provider.
      #
      # Also sets a one-shot +force_refresh+ flag so on-disk providers skip
      # their freshness short-circuit instead of re-serving the revoked token.
      #
      # @return [void]
      def invalidate
        @lock.synchronize do
          @cached = nil
          @next_force = true
        end
      end

      private

      def detect_force_refresh_support
        return false unless @provider.respond_to?(:call)

        params = if @provider.respond_to?(:parameters)
          @provider.parameters
        else
          @provider.method(:call).parameters
        end

        params.any? { |type, name| name == :force_refresh && [:key, :keyreq].include?(type) }
      end

      def invoke_provider(force:)
        if @provider_accepts_force_refresh
          @provider.call(force_refresh: force)
        else
          @provider.call
        end
      end
    end
  end
end
