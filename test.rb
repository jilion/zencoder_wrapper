require './lib/zencoder_wrapper'

class Video
  attr_accessor :user_id, :token, :path

  def initialize(params)
    params.each do |attr, value|
      self.send("#{attr}=", value)
    end
    @user_id = 1
  end

  # Workaround for ERB binding
  def get_binding
    binding()
  end
end

experiment = 'normal'

videos = []
videos << Video.new(
  token: "#{experiment}-sublime_720",
  path:  'http://media.jilion.com/videos/demo/midnight_sun_sv1_720p.mp4')
videos << Video.new(
  token: "#{experiment}-zencodertesting_test",
  path:  'http://s3.amazonaws.com/zencodertesting/test.mov')
videos << Video.new(
  token: "#{experiment}-steve_d8",
  path:  'http://m.wsj.net/video/20100602/060110atdjobstablet/060110atdjobstablet_1500k.mp4')

videos.each do |video|
  puts "--------"
  puts "Video: #{video.token}"
  response = ZencoderWrapper.create_job(video)
  puts "Status code: #{response.code}"
  puts "ID: #{response.body['id']}"
  puts "errors: #{response.body['errors']}"
end