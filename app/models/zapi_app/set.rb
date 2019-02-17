class ZapiApp::Set

  def self.fetch(args)
    # 20b4ca7d-ab24-406c-8838-493847330f8d
    model_id = args[:model_id]
    url = URI.parse("https://www.zapi.app/api/v1/model/#{model_id}/instances?key=#{ENV['ZAPI_PRIVATE_KEY']}")
    res = Net::HTTP.get(url)
    if res.code === '200'
      JSON.parse(res.body)["data"].map do |i|
        OpenStruct.new(i["attributes"].except("data").merge(i["attributes"]["data"]))
      end
    else
      false
    end
  end

  def self.model_struct
    @model_struct ||= Struct.new("Post", :title, :content)
  end

end
