class PlaintSubmitMailer < ApplicationMailer
	def plaint_submit_mail(complaint, admin)
	    @complaint = complaint
	    @admin = admin
	    mail to: @admin.email , subject: "Complaint notification of "+ @complaint.user.name
  	end
end
