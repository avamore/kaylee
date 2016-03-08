require 'Slack'
require 'pp'
require_relative 'classes/deploy'
require_relative 'helpers/parse'

include Parse

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
end

client = Slack::Web::Client.new

client.auth_test

client = Slack::RealTime::Client.new

client.on :hello do
  puts 'Successfully connected.'
end

client.on :message do |data|
  pp data
  if data['user'] != 'U0FRM09MG' && if data['text'].downcase.start_with?('kaylee')
        if parseGenericInformation(data['text'], ('deploy'))
            deploy = Deploy.new(parseEnvironmentName(data['text']), 'test', 'Test')
            pp data
            client.message channel: data['channel'], text: "<@#{data['user']}> has requested the latest deployment to "+ deploy.GetDeploymentEnvironment.upcase + ' continue?'
        end

      end
  end
end

client.start!


