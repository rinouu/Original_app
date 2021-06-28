class PlaintResolvedMailer < ApplicationMailer
	def plaint_resolved_mail(complaint, admin)
	    @complaint = complaint
	    @admin = admin
	    mail to: @complaint.user.email , subject: "Complaint resolved notification"
  	end
end
