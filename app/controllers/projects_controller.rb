class ProjectsController < ApplicationController
  def index
  	@projects = Project.all
  end

  def new 
  end

  def create
  	@project = Project.new(project_params)
  	@project.data_de_conclusao = nil;
  	@project.estado = "ativo";

  	@project.save
  	redirect_to @project
  end

  def show
  	@project = Project.find(params[:id])
  end

  private
	  def project_params
	    params.require(:project).permit(:nome, :cliente)
	  end
end
