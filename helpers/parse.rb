require 'pp'

module Parse

  def parseEnvironmentName(env)
    pp "The following data will be parsed: " + env

    /^.*deploy.*to\s(?<enviroment>.*)$/ =~ env

    return enviroment
  end

  def parseGenericInformation(text, data)
    result = false
    pp "The following data will be parsed: " + text

    if text.include? data
      result = true
    end

    return result

  end

end