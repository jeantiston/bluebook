class SubjectsController < ApplicationController
	def index
		#@content_first = "some random text";
		#@content_sec = "some random text2";
		@subjects = Subject.all 
	end

	def new
		@subject = Subject.new
		#@category = Category.all

	end

	def create
		@subject = Subject.new(subject_params)
		if @subject.save
			redirect_to subjects_path, :notice => "SAVED!"
		else
			render "new"
		end
			
	end

	def edit
		@subject = Subject.find(params[:id])

	end

	def update
		@subject = Subject.find(params[:id])

		if @subject.update_attributes(params[:subject])
			redirect_to subject_path, :notice => "UPDATED"
		else
			render "edit"
		end
	end

	def show
		@subject = Subject.find(params[:id])

	end

	def destroy
		@subject = Subject.find(params[:id])
		@subject.destroy
		redirect_to subjects_path, :notice => "DELETED :'("
	end
	
	private
		def subject_params
			params.require(:subject).permit(:title, :description)
		end
end
