require 'bundler'
require 'erb'
require 'yaml'
Bundler.require

# Full Access API Key
ENV['ZENCODER_API_KEY'] = '10d6ae768e3d55b4a479222672abc623'

class ZencoderWrapper

  def self.create_job(video)
    Zencoder::Job.create job_request(video)
  end

  def self.job_request(video)
    path = File.expand_path('../../config/zencoder_job_request.yml', __FILE__)
    erb_result = ERB.new(File.new(path).read).result(video.get_binding)
    YAML.load(erb_result)
  end

end
