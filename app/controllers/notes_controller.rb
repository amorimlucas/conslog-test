class NotesController < ApplicationController
	def create
    @project = Project.find(params[:project_id])
    @comment = @project.notes.create(note_params)
    redirect_to project_path(@project)
  end
 
  private
    def note_params
      params.require(:note).permit(:texto)
    end
end
