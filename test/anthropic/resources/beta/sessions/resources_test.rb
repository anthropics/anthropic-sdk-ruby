# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::Sessions::ResourcesTest < Anthropic::Test::ResourceTest
  def test_retrieve_required_params
    skip("prism can't find endpoint with beta only tag")

    response =
      @anthropic.beta.sessions.resources.retrieve(
        "sesrsc_011CZkZBJq5dWxk9fVLNcPht",
        session_id: "sesn_011CZkZAtmR3yMPDzynEDxu7"
      )

    assert_pattern do
      response => Anthropic::Models::Beta::Sessions::ResourceRetrieveResponse
    end

    assert_pattern do
      case response
      in Anthropic::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource
      in Anthropic::Beta::Sessions::BetaManagedAgentsFileResource
      in Anthropic::Beta::Sessions::BetaManagedAgentsMemoryStoreResource
      end
    end

    assert_pattern do
      case response
      in {
        type: :github_repository,
        id: String,
        created_at: Time,
        mount_path: String,
        updated_at: Time,
        url: String,
        checkout: Anthropic::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource::Checkout | nil
      }
      in {type: :file, id: String, created_at: Time, file_id: String, mount_path: String, updated_at: Time}
      in {
        type: :memory_store,
        memory_store_id: String,
        access: Anthropic::Beta::Sessions::BetaManagedAgentsMemoryStoreResource::Access | nil,
        description: String | nil,
        instructions: String | nil,
        mount_path: String | nil,
        name: String | nil
      }
      end
    end
  end

  def test_update_required_params
    skip("prism can't find endpoint with beta only tag")

    response =
      @anthropic.beta.sessions.resources.update(
        "sesrsc_011CZkZBJq5dWxk9fVLNcPht",
        session_id: "sesn_011CZkZAtmR3yMPDzynEDxu7",
        authorization_token: "ghp_exampletoken"
      )

    assert_pattern do
      response => Anthropic::Models::Beta::Sessions::ResourceUpdateResponse
    end

    assert_pattern do
      case response
      in Anthropic::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource
      in Anthropic::Beta::Sessions::BetaManagedAgentsFileResource
      in Anthropic::Beta::Sessions::BetaManagedAgentsMemoryStoreResource
      end
    end

    assert_pattern do
      case response
      in {
        type: :github_repository,
        id: String,
        created_at: Time,
        mount_path: String,
        updated_at: Time,
        url: String,
        checkout: Anthropic::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource::Checkout | nil
      }
      in {type: :file, id: String, created_at: Time, file_id: String, mount_path: String, updated_at: Time}
      in {
        type: :memory_store,
        memory_store_id: String,
        access: Anthropic::Beta::Sessions::BetaManagedAgentsMemoryStoreResource::Access | nil,
        description: String | nil,
        instructions: String | nil,
        mount_path: String | nil,
        name: String | nil
      }
      end
    end
  end

  def test_list
    skip("prism can't find endpoint with beta only tag")

    response = @anthropic.beta.sessions.resources.list("sesn_011CZkZAtmR3yMPDzynEDxu7")

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Sessions::BetaManagedAgentsSessionResource
    end

    assert_pattern do
      case row
      in Anthropic::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource
      in Anthropic::Beta::Sessions::BetaManagedAgentsFileResource
      in Anthropic::Beta::Sessions::BetaManagedAgentsMemoryStoreResource
      end
    end

    assert_pattern do
      case row
      in {
        type: :github_repository,
        id: String,
        created_at: Time,
        mount_path: String,
        updated_at: Time,
        url: String,
        checkout: Anthropic::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource::Checkout | nil
      }
      in {type: :file, id: String, created_at: Time, file_id: String, mount_path: String, updated_at: Time}
      in {
        type: :memory_store,
        memory_store_id: String,
        access: Anthropic::Beta::Sessions::BetaManagedAgentsMemoryStoreResource::Access | nil,
        description: String | nil,
        instructions: String | nil,
        mount_path: String | nil,
        name: String | nil
      }
      end
    end
  end

  def test_delete_required_params
    skip("prism can't find endpoint with beta only tag")

    response =
      @anthropic.beta.sessions.resources.delete(
        "sesrsc_011CZkZBJq5dWxk9fVLNcPht",
        session_id: "sesn_011CZkZAtmR3yMPDzynEDxu7"
      )

    assert_pattern do
      response => Anthropic::Beta::Sessions::BetaManagedAgentsDeleteSessionResource
    end

    assert_pattern do
      response => {
        id: String,
        type: Anthropic::Beta::Sessions::BetaManagedAgentsDeleteSessionResource::Type
      }
    end
  end

  def test_add_required_params
    skip("prism can't find endpoint with beta only tag")

    response =
      @anthropic.beta.sessions.resources.add(
        "sesn_011CZkZAtmR3yMPDzynEDxu7",
        file_id: "file_011CNha8iCJcU1wXNR6q4V8w",
        type: :file
      )

    assert_pattern do
      response => Anthropic::Beta::Sessions::BetaManagedAgentsFileResource
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        file_id: String,
        mount_path: String,
        type: Anthropic::Beta::Sessions::BetaManagedAgentsFileResource::Type,
        updated_at: Time
      }
    end
  end
end
