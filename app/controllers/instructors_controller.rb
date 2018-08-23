class InstructorsController < ApplicationController
    def index 
        @instructor = Instructor.all
      end

      def show
        @instructor = Instructor.find(params[:id])
    end

      def new 
       @new_instructor = Instructor.new
      end

      def create
    #    @instructor =  Instructor.create(name: params[:instructor][:name], last_name: params[:instructor][:last_name],age: params[:instructor][:age], salary: params[:instructor][:salary],education: params[:instructor][:eduacation], email: params[:instructor][:email], password: params[:instructor][:password])
       Instructor.create(instructor_params)
       p "i am create"
     
        redirect_to '/instructors'
      end

      def edit
        @instructor = Instructor.find(params[:id])
       
      end
    
      def update
        instructor = Instructor.find(params[:id])
        instructor.update(instructor_params)
        redirect_to '/instructors'
      end
    
    
    

      private
    # Using a private method to encapsulate the permissible parameters is
    # a good pattern since you'll be able to reuse the same permit
    # list between create and update. Also, you can specialize this method
    # with per-user checking of permissible attributes.
    def instructor_params
      params.require(:instructor).permit(:name, :last_name, :age, :salary, :education, :email, :password)
    end
end
