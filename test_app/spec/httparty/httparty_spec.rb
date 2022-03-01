describe 'HTTParty' do
  it 'content-type' do
    # stub_request(:get, 'https://jsonplaceholder.typicode.com/posts/2')
    #   .to_return(status: 200, body: '', headers: { 'content-type': 'application/json; charset= utf-8' })

    VCR.use_cassette("jsonplaceholder/posts") do
      response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
      content_type = response.headers['content-type']
      expect(content_type).to match(%r{application/json})
    end
  end

  it 'VCR using rspec metadata', vcr: { cassette_name: 'jsonplaceholder/posts'} do
    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
    content_type = response.headers['content-type']
    expect(content_type).to match(/application\/json/)
  end

  it 'VCR matching on body', vcr: { cassette_name: 'jsonplaceholder/posts', match_requests_on: [:body] } do
    response = HTTParty.get("https://jsonplaceholder.typicode.com/posts/#{[1,2,3,4].sample}")
    content_type = response.headers['content-type']
    expect(content_type).to match(/application\/json/)
  end

end