class SendMailer < ApplicationMailer
    def contact_email(email, subject)
        mail(to: email, subject: subject)
    end
end
