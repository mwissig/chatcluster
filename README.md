#A basic chat app using Rails and ActionCable

See this deployed at:
https://chatcluster.herokuapp.com

BASED ON THE TUTORIAL AT:
https://www.learnenough.com/action-cable-tutorial

TO CONVERT A STANDARD RAILS APP INTO AN APP WITH REAL-TIME UPDATES

*Jquery may be required

1. In terminal:

        rails g channel CHANNELNAME

  creates CHANNELNAME_channel.rb<br/>
  
     def subsribed
      stream_from "CHANNELNAME_channel"
     end
    
2. in controller for model associated with channel:

        def create
         @model = MODEL.new(model_params)
            if @model.save
               ActionCable.server.broadcast 'CHANNELNAME_channel"
                                      content: @model.column
          end
        end

3. in routes.rb

       mount ActionCable.server, at '/cable'

4. On form:

        form_for(@model, remote: true)
    
5. in CHANNELNAME.coffee

       received: (data) ->
           COFFEESCRIPT ACTION IN RESPONSE TO RECIEVED DATA
          
          (ex. alert data.column produces an alert)
          
      If making a simple chat, this is where you want to append the new message as it comes in.
      For example, in chatcluster, the code is:
          
        unless data.body.blank? 
         $('#posts').append '<div class="post">' + data.body + '</div>'
      
      (Plus some extra code to scroll to the bottom for each new chat post)
          
 TO DEPLOY ON HEROKU:
 
1. in gemfile add

       gem 'kramdown', '1.10.0'
       gem 'redis', '3.3.1'
       
2. in terminal:

       heroku addons:create redistogo
    
3. in terminal:

       heroku config | grep REDISTOGO_URL
       
      copy url this returns
    
  4. in cable.yml
  
    production:
     adapter: redis
     url: THE URL YOU GOT IN STEP 3
    
5. in production.rb add

        config.action_cable.url = 'wss://appname.herokuapp.com/cable'
        config.action_cable.allowed_request_origins = [
       'https://appname.herokuapp.com' ]
    

    
 
       
 
