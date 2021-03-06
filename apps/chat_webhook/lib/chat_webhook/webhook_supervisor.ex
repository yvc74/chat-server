defmodule ChatWebhook.WebhookSupervisor do
  use Supervisor

  def start_link(opts \\ []) do
    Supervisor.start_link(__MODULE__, :ok, name: (opts[:name] || __MODULE__))
  end

  def start_webhook(callback) do
    Supervisor.start_child(__MODULE__, [callback])
  end

  def init(:ok) do
    supervise([
      worker(ChatWebhook.Webhook, [], restart: :transient)
    ], strategy: :simple_one_for_one)
  end
end
