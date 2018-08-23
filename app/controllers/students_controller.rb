class StudentsController < ApplicationController
    def index 
        @student = Student.all
      end
    def show
        @student = Student.find(params[:id])
    end

      def new 
       @new_student = Student.new
      end

      def create
       @student=  Student.create(name: params[:student][:name], last_name: params[:student][:last_name],age: params[:student][:age], email: params[:student][:email],password: params[:student][:password], cohort_id: params[:student][:cohort_id])
       p "i am create"
        redirect_to '/students'
      end
end
