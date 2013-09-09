class AsyncController < ApplicationController
  helper :async

  def index
    respond_to do |format|
      format.html
      format.js do
        # This should really be done using something like Resque or Sidekiq
        # so it's a little clearer that this is an async job.
        # Still, this does function, just a little flaky, especially without JS on the client.
        # Also, sending an email with a helper is particularly bad practice.
        # Helpers should do view things like rendering HTML
        view_context.send_email_to_user
        head :ok
      end
    end
  end
end
