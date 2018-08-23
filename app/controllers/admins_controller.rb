class AdminsController < ApplicationController
    def index 
      @admin = Admin.all
    end

    def show
      @admin = Admin.(params[:id])
    end

    def new
      @new_admin = Admin.new
    end

    def create 
        @create_admin = Admin.create(name: params[:post][:name], last_name: params[:post][:last_name], email: params[:post][email], password: params[:post][password])
    end
end
