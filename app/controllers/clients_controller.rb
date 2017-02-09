class ClientsController < ApplicationController

	before_action :authenticate_user!

	def index
		@clients = Client.all
		@client = current_user.clients 
		 #Client.where('user_id = ?,current_user.id')
		

	  end

	  def new
	  	@client = Client.new
	  end

	  def create
	  	@client = Client.new(client_params)
	  	@client.user_id = current_user.id #used to attach this client to the current logged in user
        @client.gender = determine_gender(@client.name)
	  	if @client.save
	  		redirect_to clients_path, notice: "sucesfuly created"
	  	else #display error message
	  		render action: "new"
	  	end
	  end

	  def show
	  	begin
	  		@client = Client.find(params[:id])
	  		@client = current_user.clients.find(params[:id])
	  	rescue ActiveRecord::RecordNotFound
	  		redirect_to clients_path, notice: "Record Not Found"
	  	end

	  	#@client = Client.find(params[:id])
	  	#@client = @client.projects #project.where('client_id = ?', @client.id)
     end


	  def export
	  	@clients = current_user.clients
	  end


	  def edit
	  	@client = Client.find(params[:id])
	  end

	  def update
	  	@client = Client.find(params[:id])
	  	if @client.update_attributes(client_params)
	  		redirect_to client_path(@client), notice: "successfully updated"
	  	else
	  		render action: "edit"
	  	end
	  end

	  def destroy
	  	@client = Client.find(params[:id])
	  	@client.destroy
	  	redirect_to clients_path, notice: "Successfully destroyed"
	  end

	  def validate_client
	  	if params[:mobile]
	  		@client = Client.find_by_mobile(params[:mobile])
	  	end
	  end



	  private

	  def client_params
	  	params[:client].permit(:name,:mobile,:website,:company,:email)
	  end

	  def determine_gender(name)
	  	    response = HTTParty.get("https://www.gender-api.com/get?name=#{name}&key=pRPLCejozFwCHFbVCR")
        return response.parsed_response["gender"]
	  end
	  	
end


#@client = Client.find(params[:id])
	  	#@client = Client.projects #project.where('client_id = ?', @client.id)

