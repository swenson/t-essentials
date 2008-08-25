class Invoicer < ActionMailer::Base
  
def invoice(client)
  # Email header info MUST be added here
  recipients client.email
  from  "<a href=\"mailto:amy@t-essentials.com\">amy@t-essentials.com</a>"
  subject "Invoice from Terra Essentials"

  # Email body substitutions go here
  body :client => client 
end

end
