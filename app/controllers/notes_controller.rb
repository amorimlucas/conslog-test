class NotesController < ApplicationController
	def create
		@project = Project.find(params[:project_id])
		@comment = @project.notes.create(note_params)
		@comment.arquived = false
		@comment.save
		
		redirect_to project_path(@project)
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
