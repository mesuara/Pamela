class InstructorsController < ApplicationController
  before_action :authenticate_user!, except: [:index]  
  
  def index 
    if current_user && current_user.admin || current_user.instructor
        @instructor = Instructor.all
      elsif current_user && current_user.student
        @user_id = current_user.id
        @student = Student.find_by(user_id: @user_id)
        @cohort = Cohort.find(@student.cohort_id)
        @instructor = Instructor.find(@cohort.instructor_id)
    
      end
      end

      def show 
        if current_user && current_user.admin
        @instructor = Instructor.find(params[:id])
        @cohort = Cohort.find_by(instructor_id: @instructor.id)
        elsif current_user && current_user.instructor
          @instructor = Instructor.find_by(user_id: current_user.id)
          pp @instuctor
          @cohort = Cohort.find_by(instructor_id: @instructor.id)

        end
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
        if current_user && current_user.admin
        instructor = Instructor.find(params[:id])
        instructor.update(instructor_params)
        redirect_to '/instructors'
      else 
        "<h1> Sorry you're not admin</h1>"
      end
      end

      def destroy
        @instructor = Instructor.find(params[:id])
        @instructor.destroy
        redirect_to instructors_path
    end
    
    
    
    

      private
  
    def instructor_params
      params.require(:instructor).permit(:name, :last_name, :age, :salary, :education, :email, :password)
    end
end
