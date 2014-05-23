class Visitor < ActiveRecord::Base
  has_no_table
  column :email, :string
  validates_presence_of :email
  validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i

  def subscribe
    mailchimp = Gibbon::API.new(Rails.application.secrets.mailchimp_api_key)
    result = mailchimp.lists.subscribe({
      :id => Rails.application.secrets.mailchimp_list_id,
      :email => {:email => self.email},
      :double_optin => false,
      :update_existing => true,
      :send_welcome => true
    })
    Rails.logger.info("Subscribed #{self.email} to MailChimp") if result
    
#     connection = GoogleDrive.login(Rails.application.secrets.email_provider_username, Rails.application.secrets.email_provider_password
# )
#     ss = connection.spreadsheet_by_title('Third-Degree')
#     if ss.nil?
#       ss = connection.create_spreadsheet('Third-Degree')
#     end
#     ws = ss.worksheets[0]
#     last_row = 1 + ws.num_rows
#     ws[last_row, 1] = Time.new

#     ws[last_row, 3] = self.email

#     ws.save
  end

end