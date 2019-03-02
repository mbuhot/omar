defmodule Omar.Blog.View do
  defmacro __using__(_opts) do
    quote do
      use Phoenix.View,
        root: "lib/templates",
        namespace: Omar.Blog

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_flash: 1, get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import Omar.Blog.ErrorHelpers
      import Omar.Blog.Gettext
      alias Omar.Blog.Router.Helpers, as: Routes
    end
  end
end
