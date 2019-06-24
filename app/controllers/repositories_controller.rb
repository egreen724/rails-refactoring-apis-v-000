class RepositoriesController < ApplicationController
  def index
    github = GithubService.new
    github.authenticate!(ENV['GITHUB_CLIENT_ID'], ENV['GITHUB_SECRET'], session[:token])
    binding.pry
    @repos_array = github.get_repos

  end

  def create
    github = GithubService.new
    github.create_repo(params[:name])
    redirect_to '/'
  end
end
