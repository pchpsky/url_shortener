defmodule UrlShortener.ShortenerTest do
  use UrlShortener.DataCase

  alias UrlShortener.Shortener

  describe "urls" do
    alias UrlShortener.Shortener.Url

    import UrlShortener.ShortenerFixtures

    @invalid_attrs %{code: nil, long_url: nil}

    test "list_urls/0 returns all urls" do
      url = url_fixture()
      assert Shortener.list_urls() == [url]
    end

    test "get_url!/1 returns the url with given id" do
      url = url_fixture()
      assert Shortener.get_url!(url.id) == url
    end

    test "create_url/1 with valid data creates a url" do
      valid_attrs = %{code: "some code", long_url: "some long_url"}

      assert {:ok, %Url{} = url} = Shortener.create_url(valid_attrs)
      assert url.code == "some code"
      assert url.long_url == "some long_url"
    end

    test "create_url/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shortener.create_url(@invalid_attrs)
    end

    test "update_url/2 with valid data updates the url" do
      url = url_fixture()
      update_attrs = %{code: "some updated code", long_url: "some updated long_url"}

      assert {:ok, %Url{} = url} = Shortener.update_url(url, update_attrs)
      assert url.code == "some updated code"
      assert url.long_url == "some updated long_url"
    end

    test "update_url/2 with invalid data returns error changeset" do
      url = url_fixture()
      assert {:error, %Ecto.Changeset{}} = Shortener.update_url(url, @invalid_attrs)
      assert url == Shortener.get_url!(url.id)
    end

    test "delete_url/1 deletes the url" do
      url = url_fixture()
      assert {:ok, %Url{}} = Shortener.delete_url(url)
      assert_raise Ecto.NoResultsError, fn -> Shortener.get_url!(url.id) end
    end

    test "change_url/1 returns a url changeset" do
      url = url_fixture()
      assert %Ecto.Changeset{} = Shortener.change_url(url)
    end
  end
end
