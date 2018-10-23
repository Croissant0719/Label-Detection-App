class GoogleCloudVision
  attr_accessor :endpoint_uri, :file_path, :detection

  def initialize(file_path, detection)
    @endpoint_uri = "https://vision.googleapis.com/v1/images:annotate?key=#{ENV['GCV_API_KEY']}"
    @file_path = file_path
    @detection = detection
  end

  def request
    http_client = HTTPClient.new
    content = Base64.strict_encode64(File.new(file_path, 'rb').read)
    response = http_client.post_content(endpoint_uri, request_json(content), 'Content-Type' => 'application/json')
    result_parse(response)
  end

  private

  def request_json(content)
    {
      requests: [{
        image: {
          content: content
        },
        features: [{
          type: "LABEL_DETECTION",
          maxResults: 10
        }]
      }]
    }.to_json
  end

  def result_parse(response)
    result = JSON.parse(response)['responses'].first
    detection = result['labelAnnotations'].map {|label| label['description']}
    label = detection
  end
end
