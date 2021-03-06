require "sinatra"
require "json"

get "/show" do
    article = {
        id: 1,
        title: "today's dialy",
        content: "It's a sunny day."
    }
    
    article.to_json
end

get "/calc" do
    return "calc"
end

get "/calc/:num" do
    number = getFactorial(params["num"])
    return "Number:#{number}\n"
end

def getFactorial(index)
    index = index.to_i
    ans = 1
    
    for i in 1..index do
        ans = ans * i
    end
    
    return ans
end

post "/edit" do
    body = request.body.read
    
    if body == ""
        status 400
    else
        body.to_json
    end
end
