# frozen_string_literal: true

require_relative "../test_helper"
require "tmpdir"

class Anthropic::Credentials::IdentityTokenFileTest < Minitest::Test
  extend Minitest::Serial

  def setup
    @original_env = ENV.to_h
    @tmpdir = Dir.mktmpdir
  end

  def teardown
    ENV.clear
    ENV.update(@original_env)
    FileUtils.rm_rf(@tmpdir)
  end

  def test_reads_token_from_explicit_path
    path = File.join(@tmpdir, "token")
    File.write(path, "jwt-from-file\n")

    provider = Anthropic::Credentials::IdentityTokenFile.new(path)
    assert_equal("jwt-from-file", provider.call)
  end

  def test_reads_token_from_env_var_path
    path = File.join(@tmpdir, "token")
    File.write(path, "jwt-from-env\n")
    ENV["ANTHROPIC_IDENTITY_TOKEN_FILE"] = path

    provider = Anthropic::Credentials::IdentityTokenFile.new
    assert_equal("jwt-from-env", provider.call)
  end

  def test_rereads_on_every_call
    path = File.join(@tmpdir, "token")
    File.write(path, "version1")

    provider = Anthropic::Credentials::IdentityTokenFile.new(path)
    assert_equal("version1", provider.call)

    File.write(path, "version2")
    assert_equal("version2", provider.call)
  end

  def test_raises_on_missing_file
    provider = Anthropic::Credentials::IdentityTokenFile.new("/nonexistent/path")

    assert_raises(Anthropic::Errors::ConfigurationError) do
      provider.call
    end
  end

  def test_raises_when_no_path_given
    ENV.delete("ANTHROPIC_IDENTITY_TOKEN_FILE")

    assert_raises(Anthropic::Errors::ConfigurationError) do
      Anthropic::Credentials::IdentityTokenFile.new
    end
  end

  def test_raises_on_empty_file
    path = File.join(@tmpdir, "empty")
    File.write(path, "")

    provider = Anthropic::Credentials::IdentityTokenFile.new(path)
    assert_raises(Anthropic::Errors::ConfigurationError) do
      provider.call
    end
  end
end
