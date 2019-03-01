defmodule Omar.Web.ConnCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Phoenix.ConnTest
      alias Omar.Web.Router.Helpers, as: Routes

      # The default endpoint for testing
      @endpoint Omar.Web.Endpoint
    end
  end

  setup _tags do
    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end
