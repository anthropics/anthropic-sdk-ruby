# frozen_string_literal: true

require_relative "../test_helper"
require "tmpdir"
require "json"

class Anthropic::Credentials::DefaultCredentialsTest < Minitest::Test
  extend Minitest::Serial

  def setup
    @original_env = ENV.to_h
    @tmpdir = Dir.mktmpdir
    FileUtils.mkdir_p(File.join(@tmpdir, "configs"))
    FileUtils.mkdir_p(File.join(@tmpdir, "credentials"))
    ENV["ANTHROPIC_CONFIG_DIR"] = @tmpdir
  end

  def use_tmpdir_as_config
    ENV["ANTHROPIC_CONFIG_DIR"] = @tmpdir
  end

  def teardown
    FileUtils.rm_rf(@tmpdir)
    ENV["ANTHROPIC_API_KEY"] = nil
    ENV["ANTHROPIC_AUTH_TOKEN"] = nil
    ENV["ANTHROPIC_PROFILE"] = nil
    ENV["ANTHROPIC_CONFIG_DIR"] = nil
    ENV["ANTHROPIC_FEDERATION_RULE_ID"] = nil
    ENV["ANTHROPIC_ORGANIZATION_ID"] = nil
    ENV["ANTHROPIC_IDENTITY_TOKEN_FILE"] = nil
    ENV["ANTHROPIC_IDENTITY_TOKEN"] = nil
    ENV["ANTHROPIC_SERVICE_ACCOUNT_ID"] = nil
    ENV["ANTHROPIC_SCOPE"] = nil
    ENV.clear
    ENV.update(@original_env)
  end

  def test_returns_nil_when_api_key_set
    ENV["ANTHROPIC_API_KEY"] = "sk-ant-123"
    result = Anthropic::Credentials.default_credentials
    assert_nil(result)
  end

  def test_returns_static_token_when_auth_token_set
    ENV["ANTHROPIC_AUTH_TOKEN"] = "oauth-token"
    result = Anthropic::Credentials.default_credentials
    assert_instance_of(Anthropic::Credentials::CredentialResult, result)
    assert_instance_of(Anthropic::Credentials::StaticToken, result.provider)
    assert_equal("oauth-token", result.provider.call.token)
  end

  def test_explicit_profile_takes_precedence
    use_tmpdir_as_config
    ENV["ANTHROPIC_PROFILE"] = "myprofile"
    write_config("myprofile", {"authentication" => {"type" => "user_oauth"}})
    write_credentials("myprofile", {"access_token" => "profile-token", "expires_at" => Time.now.to_i + 3600})

    result = Anthropic::Credentials.default_credentials
    assert_instance_of(Anthropic::Credentials::CredentialResult, result)
  end

  def test_federation_env_vars_work_when_no_profile
    ENV["ANTHROPIC_FEDERATION_RULE_ID"] = "fdrl_01abc"
    ENV["ANTHROPIC_ORGANIZATION_ID"] = "org-123"
    ENV["ANTHROPIC_IDENTITY_TOKEN_FILE"] = token_file("jwt")

    result = Anthropic::Credentials.default_credentials
    assert_instance_of(Anthropic::Credentials::CredentialResult, result)
    assert_instance_of(Anthropic::Credentials::WorkloadIdentity, result.provider)
  end

  def test_fallback_profile_used_when_config_dir_set_with_default_profile
    use_tmpdir_as_config
    write_config("default", {"authentication" => {"type" => "user_oauth"}})
    write_credentials("default", {"access_token" => "fallback-token", "expires_at" => Time.now.to_i + 3600})

    result = Anthropic::Credentials.default_credentials
    assert_instance_of(Anthropic::Credentials::CredentialResult, result)
  end

  def test_returns_nil_when_nothing_matches
    result = Anthropic::Credentials.default_credentials
    assert_nil(result)
  end

  def test_federation_env_vars_beat_active_config_pointer
    # Regression: a leftover active_config pointer from a past `ant auth
    # login` (or similar) must NOT preempt env-var WIF. A machine with WIF
    # env vars wired up should use WIF regardless of on-disk state.
    use_tmpdir_as_config
    File.write(File.join(@tmpdir, "active_config"), "myprofile")
    write_config("myprofile", {"authentication" => {"type" => "user_oauth"}})
    # Deliberately DON'T write credentials/myprofile.json -- stale pointer.

    ENV["ANTHROPIC_FEDERATION_RULE_ID"] = "fdrl_01abc"
    ENV["ANTHROPIC_ORGANIZATION_ID"] = "org-123"
    ENV["ANTHROPIC_IDENTITY_TOKEN_FILE"] = token_file("jwt")

    result = Anthropic::Credentials.default_credentials
    assert_instance_of(Anthropic::Credentials::CredentialResult, result)
    assert_instance_of(Anthropic::Credentials::WorkloadIdentity, result.provider)
  end

  def test_active_config_pointer_still_used_as_fallback
    # When WIF env vars are absent, a pointer to a valid profile still
    # resolves (step 5 fallback). This confirms the move from step 3 to
    # step 5 didn't break the common `ant auth login` case.
    use_tmpdir_as_config
    File.write(File.join(@tmpdir, "active_config"), "myprofile")
    write_config("myprofile", {"authentication" => {"type" => "user_oauth"}})
    write_credentials("myprofile", {"access_token" => "pointer-token", "expires_at" => Time.now.to_i + 3600})

    result = Anthropic::Credentials.default_credentials
    assert_instance_of(Anthropic::Credentials::CredentialResult, result)
    assert_instance_of(Anthropic::Credentials::CredentialsFile, result.provider)
  end

  def test_explicit_profile_beats_federation_env_vars
    use_tmpdir_as_config
    ENV["ANTHROPIC_PROFILE"] = "myprofile"
    ENV["ANTHROPIC_FEDERATION_RULE_ID"] = "fdrl_01abc"
    ENV["ANTHROPIC_ORGANIZATION_ID"] = "org-123"
    ENV["ANTHROPIC_IDENTITY_TOKEN_FILE"] = token_file("jwt")

    write_config("myprofile", {"authentication" => {"type" => "user_oauth"}})
    write_credentials("myprofile", {"access_token" => "profile-token", "expires_at" => Time.now.to_i + 3600})

    result = Anthropic::Credentials.default_credentials
    assert_instance_of(Anthropic::Credentials::CredentialsFile, result.provider)
  end

  private

  def write_config(profile, data)
    File.write(File.join(@tmpdir, "configs", "#{profile}.json"), JSON.generate(data))
  end

  def write_credentials(profile, data)
    path = File.join(@tmpdir, "credentials", "#{profile}.json")
    File.write(path, JSON.generate(data))
    File.chmod(0o600, path)
  end

  def token_file(content)
    path = File.join(@tmpdir, "token_#{rand(10_000)}")
    File.write(path, content)
    path
  end
end
