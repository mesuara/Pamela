class CoursesController < ApplicationController
    def index
        @courses = Course.alls
      end
    
      def show
        @course = Course.find(params[:id])
      end
    
      def new
        @course = Course.new
      end
    
      def create
        Course.create(course_params)
        redirect_to courses_path
      end
    
      def edit
        @course = Course.find(params[:id])
      end
    
      def update
        course = Course.find(params[:id])
        course.update(course_params)
        redirect_to courses_path
      end
    
end
