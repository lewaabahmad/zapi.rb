class ZapiApp::Model

  def self.fetch(args)
    instance_id = args[:instance_id]
    url = URI.parse("https://www.zapi.app/api/v1/instances/#{instance_id}?key=#{ENV['ZAPI_PRIVATE_KEY']}")
    res = Net::HTTP.get(url)
    i = JSON.parse(res)["data"]
    OpenStruct.new(i["attributes"].except("data").merge(i["attributes"]["data"]))
  end

  def self.model_struct
    @model_struct ||= Struct.new("Post", :title, :content)
  end

end
