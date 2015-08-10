require 'rest-client'
include ApplicationHelper

class Api::CreateJobsController < ApplicationController
  #helper :all

  def new
    create_jenkins_job(params[:project], params[:repository])
    render json: {
               project_name: params[:project],
               repository_name: params[:repository]
           }.to_json


  end


  private
 # def create_job_permit_params
  #  params.require("job").permit(:project, :repository)

  #end


end