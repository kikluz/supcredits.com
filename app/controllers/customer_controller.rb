require 'rest-client'
require "#{Rails.root}/lib/square_api"

class CustomerController < ApplicationController

  def index
    # get customers and put into a variable
    @customers = SquareApi.new.get_squareup_customers()

    # filter customers names
    unless params[:search].blank?
      @customers = @customers.select {|c| c['given_name'].downcase.include? params[:search].downcase.strip }
    end
    # variable.count puts into variable
    @results_count = @customers.count

  end

  def show

    # squareup customer
    @customer = SquareApi.new.get_squareup_customer(params['id'])

    # credit history
    @credits = Credit.where(customer_id: params['id']).order('created_at desc')

    # remaining credits
    @count_credits = @credits.sum(:amount)
  end

  def new

  end

  def create

    customer_hash = {
      given_name: params[:first],
      family_name: params[:last]
    }

    response = SquareApi.new.create_squareup_customer(customer_hash)
    redirect_to customer_index_path

  end

  private


end
