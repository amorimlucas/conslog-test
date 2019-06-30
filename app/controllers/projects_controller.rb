class ProjectsController < ApplicationController
	def index
		@projects = Project.all
		@projects = @projects.order(created_at: :desc)
	end

	def show
		@project = Project.find(params[:id])
		@unarquived_notes_count = @project.notes.where(arquived: false).count;
	end

	def new 
		@project = Project.new
	end

	def edit
		@project = Project.find(params[:id])
	end

	def create
		@project = Project.new(project_params)
		@project.data_de_conclusao = nil;
		@project.estado = "Ativo";

		if @project.save
	    	redirect_to @project
	  	else
	    	render 'new'
	  	end
		
	end

	def update
		@project = Project.find(params[:id])

		if @project.update(project_params)
		  	redirect_to @project
		else
		  	render 'edit'
		end
	end

	def conclude
		@project = Project.find(params[:id])
		@project.data_de_conclusao = DateTime.now
		@project.estado = "Concluído";
		@project.save

		redirect_to projects_path
	end

  	def arquive
		@project = Project.find(params[:id])
		@project.arquived = true;
		@project.arquived_date = DateTime.now;
		@project.save

		redirect_to projects_path
	end

	def bulk_arquive
		params[:project_ids].each do |id|
			@project = Project.find(id)
			@project.arquived = true;
			@project.arquived_date = DateTime.now;
			@project.save
		end

		redirect_to projects_path
	end

  	private
		def project_params
			params.require(:project).permit(:nome, :cliente)
		end

		def bulk_arquive_params
			params.require(:project).permit(:project_ids)
		end
end
