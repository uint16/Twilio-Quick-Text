#Damas Mlabwa, September 2014

Shoes.setup do
	gem "twilio-ruby"
end

require "twilio-ruby"

Shoes.app(title: "Quick Text", width: 250, height: 250, resizable: true) {

	@from = "Insert twilio number here"
	@account_sid = "Insert Account SID here"
	@auth_token = "Insert Authentication token here"

	@client = Twilio::REST::Client.new @account_sid, @auth_token

	stack {
		@eline = edit_line :width => 200 
			@eline.text = "Enter phone number..."
		@ebox  = edit_box  :width => 200, :height => 100 
			@ebox.text = "Enter text message..."

		button("Send"){
			@client.account.messages.create(:from => @from, :to => @eline.text(), :body => @ebox.text())
			alert("Message sent, we'll try to deliver it...")
				@ebox.text= "Enter text message..."
				@eline.text ="Enter phone number..."
			
		}

		inscription "Damagination, 2014"
	}
}
