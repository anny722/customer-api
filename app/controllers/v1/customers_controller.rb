module V1
  class CustomersController < ApplicationController
    before_action :set_customer, only: [:show, :update, :destroy]
    def index
      @customers = Customer.all
      #render json: @customers, status: :ok
    end

    def show
    end

    def create
      @customer = Customer.new(customer_params)
      if @customer.save
        render :create, status: :created
      else
        render_error
      end
    end

    def update
      if @customer.update(customer_params)
        render :update, status: :ok
      else
        render_error
      end
    end

    def destroy
      if @customer.destroy
        head(:ok)
      else
        head(:unprocessable_entity)
      end
    end

    private

    def customer_params
      params.permit(:first_name, :last_name, :email, :phone)
    end

    def set_customer
      @customer = Customer.find(params[:id])
    end

    def render_error
      render json: {errors: @customer.errors.fullmessages}, status: :unprocessable_entity
    end
  end
end
