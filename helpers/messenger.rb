require 'Slack'
require 'pp'
require_relative '../classes/deploy'
require_relative 'parse'

include Parse

module Messenger



  def self.send_deployment_message(data, dep)
   "Shiny! <@#{data['user']}> has requested " + dep.get_deployment_version + ' of ' + dep.get_deployment_project + ' to ' + dep.get_deployment_environment.upcase + '. The deployment will begin shortly'
  end

end