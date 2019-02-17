class ZapiApp::Model

  def self.fetch(args)
    instance_id = args[:instance_id]
    url = URI.parse("http://localhost:3000/api/v1/instances/#{instance_id}?key=#{ENV['ZAPI_PRIVATE_KEY']}")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) do |http|
      http.request(req)
    end
    if res.code === '200'
      i = JSON.parse(res.body)["data"]
      OpenStruct.new(i["attributes"].except("data").merge(i["attributes"]["data"]))
    else
      false
    end
  end

  def self.model_struct
    @model_struct ||= Struct.new("Post", :title, :content)
  end

end
