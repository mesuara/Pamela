class StudentsController < ApplicationController
  before_action :authenticate_user!, except: [:index] 
    
  def index
    if current_user && current_user.admin
        @student = Student.all
      elsif current_user && current_user.student
        @user_id = current_user.id
        @student = Student.find_by(user_id: @user_id)
        pp @student
      else
        @instructor = Instructor.find_by(user_id: @current_user.id)
        @cohort = Cohort.find_by(instructor_id: @instructor.id)
        @student = Student.find_by(cohort_id: @cohort.id)
      end
      end
    def show
      
        @student = Student.find(params[:id])
        @cohort = Cohort.find(@student.cohort_id)
     
    end
    
      def new 
      
       @student = Student.new
       
      end

      def create
        if current_user && current_user.admin
          @student_user = User.create(email: params[:student][:email], password: params[:student][:password], student: true)
          @id = @student_user.id
       @student=  Student.create(name: params[:student][:name], last_name: params[:student][:last_name],age: params[:student][:age], email: params[:student][:email],password: params[:student][:password], cohort_id: params[:student][:cohort_id], user_id: @id)
       p "i am create"
        redirect_to '/students'
      else 
        "<h1> Sorry you're not admin</h1>"
      end
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
