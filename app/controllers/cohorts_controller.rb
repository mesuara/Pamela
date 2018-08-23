class CohortsController < ApplicationController
    def index
        @cohorts = Cohort.all
      end
    
      def show
        @cohort = Cohort.find(params[:id])
        @instructors = @cohort.instructors.all
        @students = @cohort.students.all
    
      end
    
      def new
        @cohort = Cohort.new
        
      end
    
      def create
        Cohort.create(cohort_params)
        
        redirect_to cohorts_path
      end
    
      def edit
        @cohort = Cohort.find(params[:id])
        @courses = Course.all
      end
    
      def update
        cohort = Cohort.find(params[:id])
        cohort.update(cohort_params)
        redirect_to cohorts_path
      end
    
end
