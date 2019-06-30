require 'rails_helper'

RSpec.describe "Features", type: :controller do
	describe 'new project validation tests' do
		it 'ensures a nome is present' do
			project = Project.new(cliente: "Lucas Amorim").save
			expect(project).to eq(false)
		end

		it 'ensures a cliente is present' do
			project = Project.new(nome: "Projeto 1").save
			expect(project).to eq(false)
		end
		it 'should save correctly' do
			project = Project.new(nome: "Projeto 1", cliente: "Lucas Amorim").save
			expect(project).to eq(true)
		end
	end

	describe ProjectsController do
		describe "GET index" do
			it "returns a 200" do
			  get :index
			  expect(response).to have_http_status(:success)
			end
		end

		describe "GET projects/conclude/:id" do
			it "should update state" do
				project = Project.new(id: 99999, nome: "Projeto 1", cliente: "Lucas Amorim").save
				get :conclude, params: {id: 99999}
				expect(Project.find(99999).estado).to eq("Concluído")
			end
		end

		describe "GET projects/arquive/:id" do
			it "should arquive project" do
				project = Project.new(id: 99999, nome: "Projeto 1", cliente: "Lucas Amorim").save
				get :arquive, params: {id: 99999}
				expect(Project.find(99999).arquived).to eq(true)
			end

			it "should save arquived date" do
				project = Project.new(id: 99999, nome: "Projeto 1", cliente: "Lucas Amorim").save
				get :arquive, params: {id: 99999}
				expect(Project.find(99999).arquived_date.blank?).to eq(false)
			end
		end
	end

end
