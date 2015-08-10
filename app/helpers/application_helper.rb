require 'rest-client'

module ApplicationHelper

  def create_jenkins_job(project, repository)
    jobs_to_be_created = %W{%s_%s_master_Build %s_%s-tester}
    jobs_to_be_created.each do |job|
      url = "http://localhost:8081/createItem?name=#{job}" % [project, repository]
      project_file = File.read(Rails.root.join('data', 'project.xml'))
      puts "Calling Jenkins endpoint"
      RestClient.post( url, project_file , :content_type => :xml)
    end



  end



end
