class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.subject = "From DevelopmentMailInterceptor: message to -> #{message.to} & message subject -> #{message.subject}"
    message.to = ENV['gmail_un']
  end
end