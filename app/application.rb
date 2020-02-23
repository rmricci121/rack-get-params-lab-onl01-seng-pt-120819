class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = []
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
      else
      resp.write "Path Not Found"
    end
    
    if req.path.match(/cart/)
      if @@cart.empty?
        resp.write "Your cart is empty"
      else
      @@cart.each do |cart|
        resp.write "#{cart}\n"
      end
      end
     end
     if req.path.match(/add/)
       add_item = req.param["item"]
       if @@item.include?(add_item)
         
    resp.finish
  end
  
  

  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end
end
