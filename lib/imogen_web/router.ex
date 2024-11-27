defmodule ImogenWeb.Router do
  use ImogenWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/image", ImogenWeb do
    pipe_through :api

    get "/square-cover", ResizeController, :square_cover
  end
end
