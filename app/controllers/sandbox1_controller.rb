class Sandbox1Controller < ApplicationController
  def clients
    #@name = "ishu"
    #@clients = Client.order("name")
    @clients = Client.all
  end

  def projects
    @projects = Project.where('start_date > ? AND start_date < ?', Date.today.beginning_of_month-3.months,Date.today.beginning_of_month).order('start_date')
     #Date.today.end_of_month
     #Date.tomorrow
  end

  def products
  end

  def get_jobs
    if params[:technology]
      technology = params[:technology]
      location = params[:location]
      @response = HTTParty.get("http://api.indeed.com/ads/apisearch?publisher=7277146494571922&q=#{technology}&l=#{location}&co=india&format=json&v=2")
    end
  end


  def zomato
    #if params [:<img%20src]
     # photos = params[:<img%20src]


    
  end


  end
  


