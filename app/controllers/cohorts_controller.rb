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
        @studentall = Student.all
        @student = []
        @studentall.each do |student|
          if student.cohort_id == @cohorts.id
            @student.push(student)
          end
        end
        elsif current_user && current_user.instructor
          @instructor = Instructor.find_by(user_id: current_user.id)
          pp @instuctor
          @cohorts = Cohort.find_by(instructor_id: @instructor.id)
          @studentall = Student.all
        @student = []
        @studentall.each do |student|
          if student.cohort_id == @cohorts.id
            @student.push(student)
          end
        end
        elsif current_user && current_user.student 
          @student = Student.find_by(user_id: current_user.id)
          @cohorts = Cohort.find(@student.cohort_id)
          @instructor = Instructor.find(@cohorts.instructor_id)
          @studentall = Student.all
        @student = []
        @studentall.each do |student|
          if student.cohort_id == @cohorts.id
            @student.push(student)
          end
        end
        end
      end
    
      def new
        @cohorts = Cohort.new
        @courses = Course.all
        @instructors = Instructor.all
        
      end
    
      def create
        if current_user && current_user.admin
        Cohort.create(cohort_params)
        flash[:notice] = "Cohort successfully created"
        redirect_to cohorts_path
      else 
        "<h1> Sorry you're not admin</h1>"
    
        end
      end
    
      def edit
        @cohorts = Cohort.find(params[:id])
        @courses = Course.all
        @instructors = Instructor.all
      end
    
      def update
        
        if current_user && current_user.admin
        cohort = Cohort.find(params[:id])
        cohort.update(cohort_params)
        flash[:notice] = "Cohort successfully updated"
        redirect_to cohorts_path
      else 
        "<h1> Sorry you're not admin</h1>"
      end
      end

      def destroy
        @cohort = Cohort.find(params[:id])
        @cohort.destroy
        redirect_to cohorts_path
    end

      private
      def cohort_params
        params.require(:cohort).permit(:name, :start_date, :end_date, :instructor_id, :course_id)
    end
end
