use Mix.Config

if Mix.env() == :test do
  config :omar_blog, Omar.Blog.TestEndpoint,
    url: [host: "localhost"],
    secret_key_base: "cKMn8Bo5V0mu90taVj7TfViFdb2jZHkItN4M5RI6rXe+tQdIJwIzsT0MWogI//Rs",
    http: [port: 4002],
    server: false
end
