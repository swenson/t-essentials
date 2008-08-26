class Invoicer < ActionMailer::Base
  
def invoice(contract)
  client = contract.client
  # Email header info MUST be added here
  recipients client.email
  cc contract.salesperson.email
  #from  "<a href=\"mailto:amy@t-essentials.com\">amy@t-essentials.com</a>"
  from "<a href=\"mailto:#{contract.salesperson.email}\">#{contract.salesperson.name}</a>"
  subject "Invoice from Terra Essentials"
  
  due = sprintf("$%.2f", contract.amount_due)

  # Email body substitutions go here
  body :client => client, :contract => contract, :due => "#{due}"
  
end

end
