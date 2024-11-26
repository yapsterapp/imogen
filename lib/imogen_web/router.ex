defmodule ImogenWeb.Router do
  use ImogenWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/image", ImogenWeb do
    pipe_through :api

    get "/resize", ResizeController, :show
  end
end
