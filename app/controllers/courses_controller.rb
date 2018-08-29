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
        if current_user && current_user.admin
        Course.create(course_params)
        redirect_to courses_path
      else 
        "<h1> Sorry you're not admin</h1>"
    
        end
      end
    
      def edit
        @courses = Course.find(params[:id])
      end
    
      def update
        if current_user && current_user.admin
        courses = Course.find(params[:id])
        course.update(course_params)
        redirect_to courses_path
      else 
        "<h1> Sorry you're not admin</h1>"
    
        end
      end

      private

      def course_params
        params.require(:course).permit(:name, :total_hours)
    end
    
end
