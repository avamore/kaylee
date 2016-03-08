require 'pp'

module Parse
  # Parses the Environment Name of out the given text from a Channel Message
  def parse_environment_name(text)
    if text.include? 'deploy'
      /^.*deploy.*\sto.*\s(?<environment>.*)/ =~ text
      parsed_env = environment
    elsif text.include? 'current'
      /^.*current.*of\s(?<environment>.*)$/ =~ text
      parsed_env = environment
    else
      parsed_env = 'err'
    end
    return parsed_env
  end


  # Parses the Version Number of out the given text from a Channel Message
  def parse_version_number(text)
    if text.include? 'deploy'
      /^.*deploy.*\s(?<version>.*)\sof.*/ =~ text
      parsed_ver = version
    else
      parsed_ver = 'err'
    end
    return parsed_ver
  end

  # Parses the Project out of the Channel Message, the Project dictates what we deploy in Octopus
  def parse_project_name(text)
    parsed_project = nil

    if text.include? 'deploy'
      /^.*deploy.*\s(?<project>.*)\sto.*/ =~ text
      parsed_project = project
    elsif text.include? 'current'
      /^.*current.*of\s(?<project>.*)\sto.*$/ =~ text
      parsed_project = project
    end

    return parsed_project
  end


  # Generic
  def parse_generic_information(text, data)
    result = false

    if text.include? data
      result = true
    end
    result
  end

end