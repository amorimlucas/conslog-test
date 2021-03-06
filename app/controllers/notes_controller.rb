class NotesController < ApplicationController
	def create
		#@project = Project.find(params[:project_id])
		#@comment = @project.notes.create(note_params)
		#@comment.arquived = false
		#@comment.save

		#if @comment.save
	    #	redirect_to project_path(@project)
	  	#else
	  	#	@unarquived_notes_count = @project.notes.where(arquived: false).count;
	    #	render template: "projects/show"
	  	#end
		

		@project = Project.find(params[:project_id])
		@comment = @project.notes.build
		#@comment.texto = "testing"
		@comment.arquived = false
		file = File.open("./public/uploads/note/file/28/Screen_Shot_2019-08-04_at_9.24.45_PM.png")
		@comment.file = file
		@comment.save

		if @comment.save
	    	redirect_to project_path(@project)
	  	else
	  		render plain: @comment.errors.full_messages
	  		#@unarquived_notes_count = @project.notes.where(arquived: false).count;
	    	#render template: "projects/show"
	  	end
		
	end

	def arquive
		@note = Note.find(params[:id])
		@note.arquived = true;
		@note.arquived_date = DateTime.now;
		@note.save

		redirect_to project_path(@note.project_id)
	end
 
	private
		def note_params
			params.require(:note).permit(:texto)
		end
end
