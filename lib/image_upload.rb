require "net/http"
require "uri"

# Token used to terminate the file in the post body. Make sure it is not
# present in the file you're uploading.
BOUNDARY = "AaB03x"

uri = URI.parse("http://localhost:3000/pictures/create")
file = "../public/images/rails.png"

post_body = []
post_body << "--#{BOUNDARY}\r\n"
post_body << "Content-Disposition: form-data; name=\"picture[image]\"; filename=\"#{File.basename(file)}\"\r\n"
post_body << "Content-Type: image/png\r\n"
post_body << "\r\n"
post_body << File.read(file)
post_body << "\r\n--#{BOUNDARY}--\r\n"

http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Post.new(uri.request_uri)
request.body = post_body.join
request["Content-Type"] = "multipart/form-data, boundary=#{BOUNDARY}"

http.request(request)