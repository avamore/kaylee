class Deploy
  @environment
  @version
  @project

  def initialize(message)
    # Parse the message and retrieve data for the deployment
    @environment = parse_environment_name(message)
    @version = parse_version_number(message)
    @project = parse_project_name(message)
  end

  def update_deployment(env, ver, prj)
    @environment = env
    @version = ver
    @project = prj
  end

  def get_deployment_environment
    @environment
  end

  def get_deployment_version
    @version
  end

  def get_deployment_project
    @project
  end

  def is_valid_deployment
    if @environment != 'err' || @project != 'err' || @version != 'err'
      return true
    else
      return false
    end
  end

end
