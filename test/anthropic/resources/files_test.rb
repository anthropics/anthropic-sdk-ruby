# frozen_string_literal: true

require_relative "../test_helper"

class Anthropic::Test::Resources::FilesTest < Anthropic::Test::ResourceTest
  def test_list
    response = @anthropic.files.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::FileMetadata
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        filename: String,
        mime_type: String,
        size_bytes: Integer,
        type: Symbol,
        downloadable: Anthropic::Internal::Type::Boolean | nil,
        expires_at: Time | nil
      }
    end
  end

  def test_delete
    response = @anthropic.files.delete("file_id")

    assert_pattern do
      response => Anthropic::DeletedFile
    end

    assert_pattern do
      response => {
        id: String,
        type: Anthropic::DeletedFile::Type | nil
      }
    end
  end

  def test_download
    response = @anthropic.files.download("file_id")

    assert_pattern do
      response => StringIO
    end
  end

  def test_retrieve_metadata
    response = @anthropic.files.retrieve_metadata("file_id")

    assert_pattern do
      response => Anthropic::FileMetadata
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        filename: String,
        mime_type: String,
        size_bytes: Integer,
        type: Symbol,
        downloadable: Anthropic::Internal::Type::Boolean | nil,
        expires_at: Time | nil
      }
    end
  end

  def test_upload_required_params
    response = @anthropic.files.upload(file: StringIO.new("Example data"))

    assert_pattern do
      response => Anthropic::FileMetadata
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        filename: String,
        mime_type: String,
        size_bytes: Integer,
        type: Symbol,
        downloadable: Anthropic::Internal::Type::Boolean | nil,
        expires_at: Time | nil
      }
    end
  end
end
