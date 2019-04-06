class ZapiApp::Model

  def inititalize(args)
    @model_id = args[:model_id]
  end

  def find(instance_id)
    ZapiApp::Instance.find(instance_id)
  end

  def find_by(args)
    generated_params = args.map { |k, v| "#{k}=#{v}" }.join('&')
    url = URI.parse("https://www.zapi.app/api/v1/search?key=#{ENV['ZAPI_PRIVATE_KEY']}&#{generated_params}")
    res = Net::HTTP.get(url)
    instances = JSON.parse(res)["data"]
    instances.map { |i| OpenStruct.new(i["attributes"].except("data").merge(i["attributes"]["data"])) }
  end

  def all
    url = URI.parse("https://www.zapi.app/api/v1/model/#{@model_id}/instances?key=#{ENV['ZAPI_PRIVATE_KEY']}")
    res = Net::HTTP.get(url)
    JSON.parse(res.body)["data"].map do |i|
      OpenStruct.new(i["attributes"].except("data").merge(i["attributes"]["data"]))
    end
  end
end
