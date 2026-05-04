# frozen_string_literal: true

require_relative "../test_helper"
require "tmpdir"

class Anthropic::Credentials::ConfigConsolidationTest < Minitest::Test
  extend Minitest::Serial

  def setup
    super
    @original_env = ENV.to_h
    @tmpdir = Dir.mktmpdir
    ENV["ANTHROPIC_CONFIG_DIR"] = @tmpdir
    FileUtils.mkdir_p(File.join(@tmpdir, "configs"))
  end

  def teardown
    ENV.clear
    ENV.update(@original_env)
    FileUtils.rm_rf(@tmpdir)
    super
  end

  def test_credentials_config_dir
    assert_equal(Pathname.new(@tmpdir), Anthropic::Credentials.config_dir)
  end

  def test_config_active_profile_validates
    ENV["ANTHROPIC_PROFILE"] = "test-profile"
    assert_equal("test-profile", Anthropic::Config.active_profile)
  end

  def test_config_file_path_validates_and_delegates
    expected = Pathname.new(@tmpdir).join("configs", "myprofile.json")
    assert_equal(expected, Anthropic::Config.config_file_path("myprofile"))

    error = assert_raises(Anthropic::Errors::ConfigurationError) do
      Anthropic::Config.config_file_path("foo/../evil")
    end
    assert_match(/path separator/, error.message)
  end

  def test_credentials_read_active_config_pointer
    File.write(File.join(@tmpdir, "active_config"), "pointer-profile")
    assert_equal("pointer-profile", Anthropic::Credentials.read_active_config_pointer)
  end

  def test_credentials_explicit_active_config
    refute(Anthropic::Credentials.explicit_active_config?)

    File.write(File.join(@tmpdir, "active_config"), "some-profile")
    assert(Anthropic::Credentials.explicit_active_config?)
  end
end
