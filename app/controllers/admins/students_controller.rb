
module Admins
class Admins::StudentsController < ApplicationController
    def index 
        @student = Student.all
      end
    def show
        @student = Student.find(params[:id])
        @cohort = Cohort.find(@student.cohort_id)
    end

      def new 
       @student = Student.new
      end

      def create
       @student=  Student.create(name: params[:student][:name], last_name: params[:student][:last_name],age: params[:student][:age], email: params[:student][:email],password: params[:student][:password], cohort_id: params[:student][:cohort_id])
       p "i am create"
        redirect_to '/students'
      end
  
          def edit
            @student = Student.find(params[:id])
           
          end
        
          def update
            student = Student.find(params[:id])
            student.update(student_params)
            redirect_to '/instructors'
          end
        
        
        
    
          private
        # Using a private method to encapsulate the permissible parameters is
        # a good pattern since you'll be able to reuse the same permit
        # list between create and update. Also, you can specialize this method
        # with per-user checking of permissible attributes.
        def instructor_params
          params.require(:student).permit(:name, :last_name, :age, :email, :password, :cohort_id)
        end
end

end