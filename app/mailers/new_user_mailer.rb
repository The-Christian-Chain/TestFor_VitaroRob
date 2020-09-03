class NewUserMailer < ApplicationMailer
    def welcome_email(member, profile)
        @member = member
        @profile = profile
        mail(to: @member.email, subject: "Welcome to the Site")
    end
end
