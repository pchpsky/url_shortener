defmodule UrlShortenerWeb.UrlLive.Show do
  use UrlShortenerWeb, :live_view

  alias UrlShortener.Shortener

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:url, Shortener.get_url!(id))}
  end

  defp page_title(:show), do: "Show Url"
  defp page_title(:edit), do: "Edit Url"
end
