#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: strong

# Error Handling and Retry Strategies Example
# ============================================
# This example demonstrates how to handle errors and implement retry strategies
# when working with the Anthropic API.

require_relative "../lib/anthropic"

# =============================================================================
# SECTION 1: Understanding Error Types
# =============================================================================
#
# The SDK provides a hierarchy of error classes:
#
# Anthropic::Errors::Error (base class)
# ├── Anthropic::Errors::ConversionError     - Response parsing failures
# ├── Anthropic::Errors::ConfigurationError  - SDK configuration issues
# └── Anthropic::Errors::APIError            - API-related errors
#     ├── Anthropic::Errors::APIConnectionError  - Network/connection issues
#     │   └── Anthropic::Errors::APITimeoutError - Request timeout
#     └── Anthropic::Errors::APIStatusError      - HTTP status errors
#         ├── BadRequestError        (400) - Invalid request parameters
#         ├── AuthenticationError    (401) - Invalid API key
#         ├── PermissionDeniedError  (403) - Access denied
#         ├── NotFoundError          (404) - Resource not found
#         ├── ConflictError          (409) - Resource conflict
#         ├── UnprocessableEntityError (422) - Validation error
#         ├── RateLimitError         (429) - Rate limit exceeded
#         └── InternalServerError    (500+) - Server-side errors

# =============================================================================
# SECTION 2: Basic Error Handling
# =============================================================================

def basic_error_handling
  puts("\n=== Basic Error Handling ===")

  client = Anthropic::Client.new

  begin
    response = client.messages.create(
      max_tokens: 1024,
      messages: [{role: :user, content: "Hello!"}],
      model: :"claude-sonnet-4-5-20250929"
    )
    puts("Success: #{response.content.first.text}")
  rescue Anthropic::Errors::AuthenticationError => e
    # Invalid API key
    puts("Authentication failed: #{e.message}")
    puts("Please check your ANTHROPIC_API_KEY environment variable")
  rescue Anthropic::Errors::RateLimitError => e
    # Rate limit exceeded - SDK automatically retries these
    puts("Rate limit exceeded: #{e.message}")
    puts("Headers: #{e.headers}") # May contain retry-after info
  rescue Anthropic::Errors::APITimeoutError => e
    # Request timed out
    puts("Request timed out: #{e.message}")
  rescue Anthropic::Errors::APIConnectionError => e
    # Network issues
    puts("Connection error: #{e.message}")
  rescue Anthropic::Errors::APIStatusError => e
    # Other HTTP errors
    puts("API error (#{e.status}): #{e.message}")
    puts("Error type: #{e.type}") if e.type
    puts("Response body: #{e.body}")
  rescue Anthropic::Errors::Error => e
    # Catch-all for SDK errors
    puts("SDK error: #{e.message}")
  end
end

# =============================================================================
# SECTION 3: Configuring Built-in Retry Behavior
# =============================================================================

def configure_retries
  puts("\n=== Configuring Retries ===")

  # The SDK automatically retries on:
  # - Connection errors (APIConnectionError)
  # - Timeout errors (APITimeoutError)
  # - Rate limit errors (429)
  # - Server errors (500+)

  # Configure retry behavior at client level
  client = Anthropic::Client.new(
    max_retries: 3,              # Default is 2
    timeout: 120.0               # Default is 10 minutes (600 seconds)
  )

  # Or configure per-request
  response = client.messages.create(
    max_tokens: 1024,
    messages: [{role: :user, content: "Hello!"}],
    model: :"claude-sonnet-4-5-20250929",
    request_options: {
      max_retries: 5,            # Override for this request
      timeout: 30.0              # Shorter timeout for this request
    }
  )

  puts("Response received with custom retry config")
  response
end

# =============================================================================
# SECTION 4: Custom Retry Logic with Exponential Backoff
# =============================================================================

def custom_retry_with_backoff
  puts("\n=== Custom Retry with Exponential Backoff ===")

  client = Anthropic::Client.new(max_retries: 0) # Disable built-in retries

  max_attempts = 5
  base_delay = 1.0    # seconds
  max_delay = 32.0    # seconds

  attempt = 0
  begin
    attempt += 1
    puts("Attempt #{attempt} of #{max_attempts}...")

    response = client.messages.create(
      max_tokens: 1024,
      messages: [{role: :user, content: "Hello!"}],
      model: :"claude-sonnet-4-5-20250929"
    )

    puts("Success on attempt #{attempt}!")
    response
  rescue Anthropic::Errors::RateLimitError, Anthropic::Errors::InternalServerError => e
    if attempt < max_attempts
      # Calculate delay with exponential backoff and jitter
      delay = [base_delay * (2**(attempt - 1)), max_delay].min
      jitter = delay * rand(0.0..0.5)
      sleep_time = delay + jitter

      puts("Retryable error (#{e.class.name}): #{e.message}")
      puts("Retrying in #{sleep_time.round(2)} seconds...")
      sleep(sleep_time)
      retry
    else
      puts("Max attempts reached, giving up.")
      raise
    end
  rescue Anthropic::Errors::APIStatusError => e
    # Don't retry client errors (4xx except 429)
    puts("Non-retryable error (#{e.status}): #{e.message}")
    raise
  end
end

# =============================================================================
# SECTION 5: Handling Streaming Errors
# =============================================================================

def handle_streaming_errors
  puts("\n=== Handling Streaming Errors ===")

  client = Anthropic::Client.new

  begin
    stream = client.messages.stream(
      max_tokens: 1024,
      messages: [{role: :user, content: "Tell me a short story"}],
      model: :"claude-sonnet-4-5-20250929"
    )

    stream.each do |event|
      case event
      in {type: "content_block_delta", delta: {type: "text_delta", text:}}
        print(text)
      in {type: "message_stop"}
        puts("\n[Stream completed]")
      else
        # Other event types
      end
    end
  rescue Anthropic::Errors::APIConnectionError => e
    # Connection lost during streaming
    puts("\nStream interrupted: #{e.message}")
    # You might want to resume from the last known state
  rescue Anthropic::Errors::APIStatusError => e
    puts("\nStream error: #{e.message}")
  end
end

# =============================================================================
# SECTION 6: Circuit Breaker Pattern
# =============================================================================

class CircuitBreaker
  CLOSED = :closed   # Normal operation
  OPEN = :open       # Failing, reject requests
  HALF_OPEN = :half_open # Testing if service recovered

  def initialize(failure_threshold: 5, reset_timeout: 60)
    @failure_threshold = failure_threshold
    @reset_timeout = reset_timeout
    @state = CLOSED
    @failure_count = 0
    @last_failure_time = nil
  end

  def call
    case @state
    when OPEN
      raise "Circuit is OPEN - request rejected" unless Time.now - @last_failure_time >= @reset_timeout
      @state = HALF_OPEN
      puts("[Circuit] Transitioning to HALF_OPEN, testing...")

    end

    begin
      result = yield
      on_success
      result
    rescue Anthropic::Errors::RateLimitError, Anthropic::Errors::InternalServerError => e
      on_failure
      raise
    end
  end

  private

  def on_success
    @failure_count = 0
    return unless @state == HALF_OPEN
    @state = CLOSED
    puts("[Circuit] Service recovered, transitioning to CLOSED")
  end

  def on_failure
    @failure_count += 1
    @last_failure_time = Time.now

    return unless @failure_count >= @failure_threshold
    @state = OPEN
    puts("[Circuit] Failure threshold reached, transitioning to OPEN")
  end
end

def circuit_breaker_example
  puts("\n=== Circuit Breaker Pattern ===")

  client = Anthropic::Client.new
  circuit = CircuitBreaker.new(failure_threshold: 3, reset_timeout: 30)

  5.times do |i|
    response = circuit.call do
      client.messages.create(
        max_tokens: 100,
        messages: [{role: :user, content: "Hello #{i}"}],
        model: :"claude-sonnet-4-5-20250929"
      )
    end
    puts("Request #{i + 1}: Success")
  rescue StandardError => e
    puts("Request #{i + 1}: #{e.message}")
  end
end

# =============================================================================
# SECTION 7: Graceful Degradation
# =============================================================================

# Helper for graceful degradation - returns a fallback response structure
FallbackContent = Struct.new(:text)
FallbackResponse = Struct.new(:content)

def build_fallback_response(message)
  FallbackResponse.new([FallbackContent.new(message)])
end

def get_ai_response(client, prompt)
  client.messages.create(
    max_tokens: 1024,
    messages: [{role: :user, content: prompt}],
    model: :"claude-sonnet-4-5-20250929"
  )
rescue Anthropic::Errors::RateLimitError
  # Fallback: Return cached or default response
  puts("Rate limited - using fallback response")
  build_fallback_response("Service is busy. Please try again later.")
rescue Anthropic::Errors::APIConnectionError
  # Fallback: Use a simpler local solution
  puts("Connection error - using offline fallback")
  build_fallback_response("Unable to connect. Here's a local response.")
rescue Anthropic::Errors::APIStatusError => e
  raise unless e.status >= 500

  # Server error: Return generic error message
  puts("Server error - using error fallback")
  build_fallback_response("Service temporarily unavailable.")
  # Client error: Re-raise to handle differently
end

def graceful_degradation
  puts("\n=== Graceful Degradation ===")

  client = Anthropic::Client.new

  response = get_ai_response(client, "Hello!")
  puts("Response: #{response.content.first.text}")
end

# =============================================================================
# SECTION 8: Logging and Monitoring
# =============================================================================

def logging_example
  puts("\n=== Logging and Monitoring ===")

  require("logger")

  logger = Logger.new($stdout)
  logger.level = Logger::INFO

  client = Anthropic::Client.new

  begin
    start_time = Time.now
    logger.info("Starting API request...")

    response = client.messages.create(
      max_tokens: 1024,
      messages: [{role: :user, content: "Hello!"}],
      model: :"claude-sonnet-4-5-20250929"
    )

    duration = Time.now - start_time
    logger.info("Request completed in #{duration.round(3)}s")
    logger.info("Tokens used: input=#{response.usage.input_tokens}, output=#{response.usage.output_tokens}")

    response
  rescue Anthropic::Errors::APIStatusError => e
    logger.error("API error: status=#{e.status}, type=#{e.type}, message=#{e.message}")
    raise
  rescue Anthropic::Errors::APIError => e
    logger.error("Connection error: #{e.class.name} - #{e.message}")
    raise
  end
end

# =============================================================================
# SECTION 9: Error Recovery Patterns Summary
# =============================================================================
#
# | Error Type              | Retryable? | Strategy                           |
# |-------------------------|------------|------------------------------------|
# | AuthenticationError     | No         | Fix API key, alert immediately     |
# | BadRequestError         | No         | Fix request parameters             |
# | PermissionDeniedError   | No         | Check permissions/access           |
# | NotFoundError           | No         | Check resource existence           |
# | UnprocessableEntityError| No         | Validate input data                |
# | RateLimitError          | Yes        | Exponential backoff, queue         |
# | InternalServerError     | Yes        | Retry with backoff                 |
# | APITimeoutError         | Yes        | Retry, consider smaller requests   |
# | APIConnectionError      | Yes        | Retry, check network               |

# =============================================================================
# Run Examples
# =============================================================================

if __FILE__ == $PROGRAM_NAME
  puts "=" * 60
  puts "Anthropic SDK - Error Handling Examples"
  puts "=" * 60

  # Uncomment examples to run:
  basic_error_handling
  # configure_retries
  # custom_retry_with_backoff
  # handle_streaming_errors
  # circuit_breaker_example
  # graceful_degradation
  # logging_example

  puts("\n#{'=' * 60}")
  puts("Examples completed!")
  puts("=" * 60)
end
