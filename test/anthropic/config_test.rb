# frozen_string_literal: true

require_relative "test_helper"
require "tmpdir"

class Anthropic::ConfigTest < Minitest::Test
  extend Minitest::Serial

  def setup
    @original_env = ENV.to_h
  end

  def teardown
    ENV.clear
    ENV.update(@original_env)
  end

  def test_config_dir_from_env
    ENV["ANTHROPIC_CONFIG_DIR"] = "/custom/config"
    assert_equal(Pathname.new("/custom/config"), Anthropic::Credentials.config_dir)
  end

  def test_config_dir_defaults_to_home_config
    ENV.delete("ANTHROPIC_CONFIG_DIR")
    ENV["HOME"] = "/home/testuser"
    assert_equal(Pathname.new("/home/testuser/.config/anthropic"), Anthropic::Credentials.config_dir)
  end

  def test_config_file_path
    ENV["ANTHROPIC_CONFIG_DIR"] = "/custom/config"
    assert_equal(
      Pathname.new("/custom/config/configs/myprofile.json"),
      Anthropic::Config.config_file_path("myprofile")
    )
  end

  def test_credentials_file_path
    ENV["ANTHROPIC_CONFIG_DIR"] = "/custom/config"
    assert_equal(
      Pathname.new("/custom/config/credentials/myprofile.json"),
      Anthropic::Config.credentials_file_path("myprofile")
    )
  end

  def test_active_profile_from_env
    Dir.mktmpdir do |dir|
      ENV["ANTHROPIC_CONFIG_DIR"] = dir
      ENV["ANTHROPIC_PROFILE"] = "production"
      assert_equal("production", Anthropic::Config.active_profile)
    end
  end

  def test_active_profile_from_pointer_file
    Dir.mktmpdir do |dir|
      ENV["ANTHROPIC_CONFIG_DIR"] = dir
      ENV.delete("ANTHROPIC_PROFILE")
      File.write(File.join(dir, "active_config"), "staging\n")
      assert_equal("staging", Anthropic::Config.active_profile)
    end
  end

  def test_active_profile_defaults_to_default
    Dir.mktmpdir do |dir|
      ENV["ANTHROPIC_CONFIG_DIR"] = dir
      ENV.delete("ANTHROPIC_PROFILE")
      assert_equal("default", Anthropic::Config.active_profile)
    end
  end

  def test_validates_profile_name_no_path_separators
    assert_raises(Anthropic::Errors::ConfigurationError) do
      Anthropic::Config.validate_profile_name!("../evil")
    end
  end

  def test_validates_profile_name_no_dots
    assert_raises(Anthropic::Errors::ConfigurationError) do
      Anthropic::Config.validate_profile_name!(".hidden")
    end
  end
end
