class InstructorsController < ApplicationController
  before_action :authenticate_user!, except: [:index]  
  
  def index 
        @instructor = Instructor.all
      end

      def show
        @instructor = Instructor.find(params[:id])
        @cohort = Cohort.find(@instructor.id)
    end

      def new 
       @instructor = Instructor.new
      end

      def create
        if current_user && current_user.admin
          @instructor_user = User.create(email: params[:instructor][:email], password: params[:instructor][:password], instructor: true)
          @id = @instructor_user.id
          # @instructor = Instructor.create(instructor_params)
          # @instructor.user_id = @id
      @instructor =  Instructor.create(name: params[:instructor][:name], last_name: params[:instructor][:last_name],age: params[:instructor][:age], salary: params[:instructor][:salary],education: params[:instructor][:eduacation], email: params[:instructor][:email], password: params[:instructor][:password],user_id: @id)
      #  @instructor = Instructor.create(instructor_params)
        redirect_to '/instructors'
      else 
        "<h1> Sorry you're not admin</h1>"
      end
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
