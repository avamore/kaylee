class Deploy
    @enviroment
    @version
    @project

  def initialize(env, ver, prj)
    @enviroment = env
    @version = ver
    @project = prj
  end

  def UpdateDeployment(env, ver, prj)
    @enviroment = env
    @version = ver
    @project = prj
  end

  def GetDeploymentEnvironment
    return @enviroment
  end

  def GetDeploymentVersion
    return @version
  end

  def GetDeploymentProject
    return @project
  end



end
