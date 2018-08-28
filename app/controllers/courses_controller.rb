class CoursesController < ApplicationController
  before_action :authenticate_user!, except: [:index]  
  
  def index
        @courses = Course.all
      end
    
      def show
        @courses = Course.find(params[:id])
      end
    
      def new
        @courses = Course.new
      end
    
      def create
        Course.create(course_params)
        redirect_to courses_path
      end
    
      def edit
        @courses = Course.find(params[:id])
      end
    
      def update
        courses = Course.find(params[:id])
        course.update(course_params)
        redirect_to courses_path
      end

      private

      def course_params
        params.require(:course).permit(:name, :total_hours)
    end
    
end
