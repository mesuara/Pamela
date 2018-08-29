class CohortsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
  
  def index
    if current_user && current_user.admin
        @cohorts = Cohort.all
    elsif 
      current_user && current_user.student
      @user_id = current_user.id
      @student = Student.find_by(user_id: @user_id)
      @cohorts = Cohort.find(@student.cohort_id)
    elsif
      current_user && current_user.instructor
      @user_id = current_user.id
        @instructor = Instructor.find_by(user_id: @user_id)
        @cohorts = Cohort.find_by(instructor_id: @instructor.id)
       
    end
      end
    
      def show
        if current_user && current_user.admin
        @cohorts = Cohort.find(params[:id])
        @instructor_id = @cohorts.instructor_id
        @instructor = Instructor.find(@instructor_id)
        elsif current_user && current_user.instructor
          @instructor = Instructor.find_by(user_id: current_user.id)
          pp @instuctor
          @cohorts = Cohort.find_by(instructor_id: @instructor.id)
        elsif current_user && current_user.student 
          @student = Student.find_by(user_id: current_user.id)
          @cohorts = Cohort.find(@student.id)
          @instructor = Instructor.find(@cohorts.instructor_id)
        end
      end
    
      def new
        @cohorts = Cohort.new
        
      end
    
      def create
        if current_user && current_user.admin
        Cohort.create(cohort_params)
        
        redirect_to cohorts_path
      else 
        "<h1> Sorry you're not admin</h1>"
    
        end
      end
    
      def edit
        @cohorts = Cohort.find(params[:id])
        @courses = Course.all
      end
    
      def update
        
        if current_user && current_user.admin
        cohort = Cohort.find(params[:id])
        cohort.update(cohort_params)
        redirect_to cohorts_path
      else 
        "<h1> Sorry you're not admin</h1>"
      end
      end
      private
      def cohort_params
        params.require(:cohort).permit(:name, :start_date, :end_date, :instructor_id, :course_id)
    end
end
