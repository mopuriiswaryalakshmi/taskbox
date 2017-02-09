class AnnouncementsController < ApplicationController

	def index
		@announcements = Announcement.all
	end

	def new
		@announcement = Announcement.new
	end

	def create
		@announcement = Announcement.new(announcement_params)
		 @announcement.user_id = current_user.id
		if @announcement.save
			Notification.announcement(@announcement).deliver
			redirect_to announcements_path, notice: "successfullly created"
		else
			render action: "new"
		end
	end

    def show
    	@announcement = Announcement.find(params[:id])
    end

    private

    def announcement_params
    	params[:announcement].permit(:title, :body, :user_id)
    end




end


<h1> Stocks List </h1>
<% if can? :create, Stock.new %>
<%= link_to 'Add Stock', new_stock_path %>
<% end %>

<p id="notice"><%= notice %></p>
<table>
  <thead>
    <tr>
    <th>BloodBankName</th>
    <th>State</th>
    <th>District</th>
    <th>Locality</th>
    <th>BloodGroup</th>
    <th>Component Type</th>
    <th>Units</th>
    <th colspan="5"></th>
    </tr>
  </thead>
  <tbody>
    <% @stocks.each do |stock| %>
      <tr>
      <td><%= stock.blood_bank.name %></td>
      <td><%= stock.blood_bank.state.name %></td>
        <td><%= stock.blood_bank.district.name %></td>
        <td><%= stock.blood_bank.locality.name %></td>
        <td><%= stock.blood_group.name %></td>
        <td><%= stock.component_type.name %></td>
        <td><%= stock.units %></td>
        <td><%= link_to 'Show', stock %></td>

        <% if can? :update, stock %>
        <td><%= link_to 'Edit', edit_stock_path(stock) %></td>
        <% end %>

        <% if can? :destroy, stock %>
        <td><%= link_to 'Destroy', stock, method: :delete, data: { confirm: 'Are you sure?' } %></td>
        <% end %>

       </tr>
    <% end %>
  </tbody>
</table>

<h1> Stocks List </h1>

<% if can? :create, Stock.new %>
<%= link_to 'Add Stock', new_stock_path %>
<% end %>


<p id="notice"><%= notice %></p>
<table>
  <thead>
    <tr>
    <th>BloodBankName</th>
    <th>State</th>
    <th>District</th>
    <th>Locality</th>
    <th>BloodGroup</th>
    <th>Component Type</th>
    <th>PresentStock</th>
     <th colspan="5"></th>
    </tr>
    
  </thead>
  <tbody>
     <ol>
     <% @stocks.each do |stock| %>
     <% stock.blood_bank.blood_availabilities.each do |presentstock| %>
     
    
      <tr>
      
      <td> <%=  presentstock.blood_bank.name %></td>
       <td> <%= presentstock.blood_bank.state.name %></td>
        <td><%= presentstock.blood_bank.district.name %></td>
        <td><%= presentstock.blood_bank.locality.name %></td>
        <td><%= presentstock.blood_group.name %></td>
        <td><%= presentstock.component_type.name %></td>
        <td><%= presentstock.total_stocks %></td>
            
         <td><%= link_to 'Show', stock %></td>


        <% if can? :update, stock %>
        <td><%= link_to 'Edit', edit_stock_path(stock) %></td>
        <% end %>


        <% if can? :destroy, stock %>
        <td><%= link_to 'Destroy', stock, method: :delete, data: { confirm: 'Are you sure?' } %></td>
        <% end %>

       </tr>
       </ol>
        <% end %> 
    <% end %>
  </tbody>
</table>



    
    


 
 





