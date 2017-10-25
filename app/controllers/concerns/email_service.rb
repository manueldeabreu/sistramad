module EmailService 
  extend ActiveSupport::Concern

  def send_email(email_data)
    user = email_data[:user]
    
    SendEmailJob.set(wait: 10.seconds).perform_later(user.email, email_data)
  end

  def send_multiple_emails(users, email_data)
    if users.present?
      users.each do |user|
        SendEmailJob.set(wait: 10.seconds).perform_later(user.email, email_data)
      end
    end
  end
  
  def send_email_transfer(user, mail_template, transfer)
    SendEmailTransferJob.set(wait: 10.seconds).perform_later(user, mail_template, transfer)
  end

  def send_emails_transfer(users, mail_template, transfer)
    users.each do |user|
      SendEmailTransferJob.set(wait: 10.seconds).perform_later(user, mail_template, transfer)
    end
  end
    
  end
