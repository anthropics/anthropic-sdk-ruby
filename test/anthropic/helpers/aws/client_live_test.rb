# frozen_string_literal: true

require_relative "../../test_helper"

# Live integration tests for the AWS gateway client. Skipped unless ANTHROPIC_LIVE=1.
#
# Run: ANTHROPIC_LIVE=1 bundle exec ruby test/anthropic/helpers/aws/client_live_test.rb
class Anthropic::Test::AWSClientLiveTest < Minitest::Test
  extend Minitest::Serial

  def skip_unless_live
    skip("set ANTHROPIC_LIVE=1 to run live integration tests") unless ENV["ANTHROPIC_LIVE"] == "1"
  end

  def require_env(*names)
    names.each do |name|
      raise "required env var #{name} is not set" if ENV[name].to_s.empty?
    end
  end

  def live_model
    ENV.fetch("ANTHROPIC_LIVE_MODEL", "claude-sonnet-4-6")
  end

  def send_aws_message(client)
    message = client.messages.create(
      model: live_model,
      max_tokens: 32,
      messages: [{role: "user", content: "Say exactly: hello"}]
    )
    refute_empty(message.content)
    puts("response: #{message.content.first.text}")
  end

  def test_live_aws_api_key
    skip_unless_live
    require_env("ANTHROPIC_AWS_API_KEY", "ANTHROPIC_AWS_WORKSPACE_ID", "AWS_REGION")

    client = Anthropic::AWSClient.new
    send_aws_message(client)
  end

  def test_live_aws_sigv4_explicit_creds
    skip_unless_live
    require_env("AWS_ACCESS_KEY_ID", "AWS_SECRET_ACCESS_KEY", "AWS_REGION", "ANTHROPIC_AWS_WORKSPACE_ID")

    # Clear API key so SigV4 is used
    original_aws_key = ENV.delete("ANTHROPIC_AWS_API_KEY")
    original_api_key = ENV.delete("ANTHROPIC_API_KEY")

    begin
      client = Anthropic::AWSClient.new(
        aws_access_key: ENV["AWS_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
        aws_session_token: ENV["AWS_SESSION_TOKEN"]
      )
      send_aws_message(client)
    ensure
      ENV["ANTHROPIC_AWS_API_KEY"] = original_aws_key if original_aws_key
      ENV["ANTHROPIC_API_KEY"] = original_api_key if original_api_key
    end
  end

  def test_live_aws_sigv4_aws_profile
    skip_unless_live
    profile = ENV.fetch("ANTHROPIC_AWS_PROFILE", "anthropic-aws")
    require_env("AWS_REGION", "ANTHROPIC_AWS_WORKSPACE_ID")

    # Clear explicit creds so the profile-based credential chain is used
    original_access_key = ENV.delete("AWS_ACCESS_KEY_ID")
    original_secret_key = ENV.delete("AWS_SECRET_ACCESS_KEY")
    original_session_token = ENV.delete("AWS_SESSION_TOKEN")
    original_aws_key = ENV.delete("ANTHROPIC_AWS_API_KEY")
    original_api_key = ENV.delete("ANTHROPIC_API_KEY")

    begin
      client = Anthropic::AWSClient.new(aws_profile: profile)
      send_aws_message(client)
    ensure
      ENV["AWS_ACCESS_KEY_ID"] = original_access_key if original_access_key
      ENV["AWS_SECRET_ACCESS_KEY"] = original_secret_key if original_secret_key
      ENV["AWS_SESSION_TOKEN"] = original_session_token if original_session_token
      ENV["ANTHROPIC_AWS_API_KEY"] = original_aws_key if original_aws_key
      ENV["ANTHROPIC_API_KEY"] = original_api_key if original_api_key
    end
  end

  def test_live_aws_sigv4_default_chain
    skip_unless_live
    require_env("AWS_REGION", "ANTHROPIC_AWS_WORKSPACE_ID")

    # Clear all API key env vars so the default AWS credential chain is used
    original_aws_key = ENV.delete("ANTHROPIC_AWS_API_KEY")
    original_api_key = ENV.delete("ANTHROPIC_API_KEY")

    begin
      client = Anthropic::AWSClient.new
      send_aws_message(client)
    ensure
      ENV["ANTHROPIC_AWS_API_KEY"] = original_aws_key if original_aws_key
      ENV["ANTHROPIC_API_KEY"] = original_api_key if original_api_key
    end
  end
end
