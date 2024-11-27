defmodule ImogenWeb.ResizeController do
  use ImogenWeb, :controller

  def square_cover(conn, %{"image_url" => image_url, "size" => size}) do
    image = Req.get!(image_url)

    {:ok, original} = Image.from_binary(image.body)
    {:ok, thumbnail} = Image.thumbnail(original, "#{size}x#{size}", fit: :cover, autorotate: true)

    thumbnail_path = Briefly.create!(extname: ".jpg")

    {:ok, _image_ref} = Image.write(thumbnail, thumbnail_path)

    conn
    |> put_resp_content_type("image/jpeg")
    |> send_file(200, thumbnail_path)
  end
end
