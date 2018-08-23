class CohortsController < ApplicationController
    def index
        @cohorts = Cohort.all
      end
    
      def show
        @cohorts = Cohort.find(params[:id])
        @instructor_id = @cohorts.instructor_id
        @instructor = Instructor.find(@instructor_id)
    
      end
    
      def new
        @cohorts = Cohort.new
        
      end
    
      def create
        Cohort.create(cohort_params)
        
        redirect_to cohorts_path
      end
    
      def edit
        @cohorts = Cohort.find(params[:id])
        @courses = Course.all
      end
    
      def update
        cohort = Cohort.find(params[:id])
        cohort.update(cohort_params)
        redirect_to cohorts_path
      end
      private
      def cohort_params
        params.require(:cohort).permit(:name, :start_date, :end_date, :instructor_id, :course_id)
    end
end
